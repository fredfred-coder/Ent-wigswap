const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Initialisation Firebase
admin.initializeApp();

// Fonction pour créer une session de paiement
exports.createPaymentSession = functions.https.onRequest((req, res) => {
  // Log de la requête
  console.log("Requête reçue :", req.body);

  try {
    // Vérification de la méthode
    if (req.method !== "POST") {
      return res.status(405).send({ error: "Méthode non autorisée" });
    }

    // Récupération des données de la requête
    const { amount, currency, success_url, error_url, userId } = req.body;

    // Validation des paramètres
    if (!amount || !currency || !success_url || !error_url || !userId) {
      return res.status(400).send({ error: "Paramètres manquants ou invalides" });
    }

    // Simule une réponse pour le test
    const paymentId = `pay_${Date.now()}`;
    const waveLaunchUrl = `https://pay.wave.com/c/${paymentId}?a=${amount}&c=${currency}&m=TestMerchant`;

    // Réponse réussie
    res.status(201).send({
      status: "success",
      paymentId,
      waveLaunchUrl,
    });
  } catch (error) {
    console.error("Erreur dans createPaymentSession :", error);
    res.status(500).send({ error: "Erreur interne" });
  }
});

