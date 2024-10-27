/* eslint-env node */
/* eslint-disable no-undef */

// Importation des modules requis
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

// Déclaration des collections Firestore
const kFcmTokensCollection = "fcm_tokens";
const kPushNotificationsCollection = "ff_push_notifications";
const firestore = admin.firestore();

// Fonction pour ajouter un FCM Token
exports.addFcmToken = functions
  .region("europe-west3")
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError('unauthenticated', 'Failed: Unauthenticated calls are not allowed.');
    }

    const { userDocPath, fcmToken, deviceType } = data;

    if (!userDocPath || !fcmToken || !deviceType || userDocPath.split("/").length <= 1) {
      throw new functions.https.HttpsError('invalid-argument', 'Invalid arguments encountered when adding FCM token.');
    }

    if (context.auth.uid !== userDocPath.split("/")[1]) {
      throw new functions.https.HttpsError('permission-denied', "Failed: Authenticated user doesn't match user provided.");
    }

    const existingTokens = await firestore
      .collectionGroup(kFcmTokensCollection)
      .where("fcm_token", "==", fcmToken)
      .get();

    let userAlreadyHasToken = false;
    for (const doc of existingTokens.docs) {
      const user = doc.ref.parent.parent;
      if (user.path !== userDocPath) {
        await doc.ref.delete();
      } else {
        userAlreadyHasToken = true;
      }
    }

    if (userAlreadyHasToken) {
      return "FCM token already exists for this user. Ignoring...";
    }

    await firestore.collection(userDocPath).doc().set({
      fcm_token: fcmToken,
      device_type: deviceType,
      created_at: admin.firestore.FieldValue.serverTimestamp(),
    });

    return "Successfully added FCM token!";
  });

// Fonction pour envoyer des notifications push
exports.sendPushNotificationsTrigger = functions
  .region("europe-west3")
  .firestore.document(`${kPushNotificationsCollection}/{id}`)
  .onCreate(async (snapshot, _) => {
    try {
      const notificationData = snapshot.data();
      if (!notificationData) {
        throw new Error('Notification data is missing');
      }
      // Ici, vous pouvez ajouter la logique pour envoyer les notifications
      console.log('Envoi de la notification :', notificationData);
    } catch (e) {
      console.error(`Erreur lors de l'envoi de la notification : ${e}`);
      await snapshot.ref.update({ status: "failed", error: `${e.message}` });
    }
  });
