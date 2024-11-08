const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");

// Initialisation de Firebase Admin
admin.initializeApp();

const kFcmTokensCollection = "fcm_tokens";
const kPushNotificationsCollection = "ff_push_notifications";
const kSchedulerIntervalMinutes = 60;
const firestore = admin.firestore();

const kPushNotificationRuntimeOpts = {
  timeoutSeconds: 540,
  memory: "2GB",
};

// Fonction pour les Requêtes vers l'API Wave
exports.proxyWaveRequest = functions.region("europe-west3").https.onRequest(async (req, res) => {
  try {
    const response = await axios({
      method: req.method,
      url: `https://api.wave.com/${req.url}`,
      headers: {
        Authorization: `Bearer ${functions.config().wave.api_key}`,
        ...req.headers,
      },
      data: req.body,
    });
    res.status(response.status).send(response.data);
  } catch (error) {
    console.error("Erreur lors de l'appel à Wave API :", error);
    res.status(error.response ? error.response.status : 500).send(error.message);
  }
});

// Fonction pour ajouter un token FCM
exports.addFcmToken = functions
  .region("europe-west3")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      return "Failed: Unauthenticated calls are not allowed.";
    }
    const userDocPath = data.userDocPath;
    const fcmToken = data.fcmToken;
    const deviceType = data.deviceType;
    if (
      typeof userDocPath === "undefined" ||
      typeof fcmToken === "undefined" ||
      typeof deviceType === "undefined" ||
      userDocPath.split("/").length <= 1 ||
      fcmToken.length === 0 ||
      deviceType.length === 0
    ) {
      return "Invalid arguments encountered when adding FCM token.";
    }
    if (context.auth.uid != userDocPath.split("/")[1]) {
      return "Failed: Authenticated user doesn't match user provided.";
    }
    const existingTokens = await firestore
      .collectionGroup(kFcmTokensCollection)
      .where("fcm_token", "==", fcmToken)
      .get();
    var userAlreadyHasToken = false;
    for (var doc of existingTokens.docs) {
      const user = doc.ref.parent.parent;
      if (user.path != userDocPath) {
        await doc.ref.delete();
      } else {
        userAlreadyHasToken = true;
      }
    }
    if (userAlreadyHasToken) {
      return "FCM token already exists for this user. Ignoring...";
    }
    await getUserFcmTokensCollection(userDocPath).doc().set({
      fcm_token: fcmToken,
      device_type: deviceType,
      created_at: admin.firestore.FieldValue.serverTimestamp(),
    });
    return "Successfully added FCM token!";
  });

// Déclencheur pour envoyer des notifications push
exports.sendPushNotificationsTrigger = functions
  .region("europe-west3")
  .runWith(kPushNotificationRuntimeOpts)
  .firestore.document(`${kPushNotificationsCollection}/{id}`)
  .onCreate(async (snapshot, _) => {
    try {
      const scheduledTime = snapshot.data().scheduled_time || "";
      if (scheduledTime) {
        return;
      }
      await sendPushNotifications(snapshot);
    } catch (e) {
      console.log(`Error: ${e}`);
      await snapshot.ref.update({ status: "failed", error: `${e}` });
    }
  });

async function sendPushNotifications(snapshot) {
  const notificationData = snapshot.data();
  const title = notificationData.notification_title || "";
  const body = notificationData.notification_text || "";
  const imageUrl = notificationData.notification_image_url || "";
  const sound = notificationData.notification_sound || "";
  const parameterData = notificationData.parameter_data || "";
  const targetAudience = notificationData.target_audience || "";
  const initialPageName = notificationData.initial_page_name || "";
  const userRefsStr = notificationData.user_refs || "";
  const batchIndex = notificationData.batch_index || 0;
  const numBatches = notificationData.num_batches || 0;
  const status = notificationData.status || "";

  if (status !== "" && status !== "started") {
    console.log(`Already processed ${snapshot.ref.path}. Skipping...`);
    return;
  }

  if (title === "" || body === "") {
    await snapshot.ref.update({ status: "failed" });
    return;
  }

  const userRefs = userRefsStr === "" ? [] : userRefsStr.trim().split(",");
  var tokens = new Set();
  if (userRefsStr) {
    for (var userRef of userRefs) {
      const userTokens = await firestore
        .doc(userRef)
        .collection(kFcmTokensCollection)
        .get();
      userTokens.docs.forEach((token) => {
        if (typeof token.data().fcm_token !== undefined) {
          tokens.add(token.data().fcm_token);
        }
      });
    }
  }

  const tokensArr = Array.from(tokens);
  var messageBatches = [];
  for (let i = 0; i < tokensArr.length; i += 500) {
    const tokensBatch = tokensArr.slice(i, Math.min(i + 500, tokensArr.length));
    const messages = {
      notification: {
        title,
        body,
        ...(imageUrl && { imageUrl: imageUrl }),
      },
      data: {
        initialPageName,
        parameterData,
      },
      android: {
        notification: {
          ...(sound && { sound: sound }),
        },
      },
      apns: {
        payload: {
          aps: {
            ...(sound && { sound: sound }),
          },
        },
      },
      tokens: tokensBatch,
    };
    messageBatches.push(messages);
  }

  var numSent = 0;
  await Promise.all(
    messageBatches.map(async (messages) => {
      const response = await admin.messaging().sendEachForMulticast(messages);
      numSent += response.successCount;
    })
  );

  await snapshot.ref.update({ status: "succeeded", num_sent: numSent });
}

function getUserFcmTokensCollection(userDocPath) {
  return firestore.doc(userDocPath).collection(kFcmTokensCollection);
}
