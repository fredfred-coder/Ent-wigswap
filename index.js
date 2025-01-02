/**
 * Import function triggers from their respective submodules:
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

/**
 * Fonction: createPaymentSession
 * Description: Crée une session de paiement et retourne une URL Wave.
 */
exports.createPaymentSession = onRequest((req, res) => {
  logger.info("Requête reçue pour createPaymentSession", {structuredData: true});

  try {
    if (req.method !== "POST") {
      return res.status(405).send({ error: "Méthode non autorisée" });
    }

    const { amount, currency, success_url, error_url, userId } = req.body;

    if (!amount || !currency || !success_url || !error_url || !userId) {
      return res.status(400).send({ error: "Paramètres manquants ou invalides" });
    }

    const paymentId = `pay_${Date.now()}`;
    const waveLaunchUrl = `https://pay.wave.com/c/${paymentId}?a=${amount}&c=${currency}&m=TestMerchant`;

    res.status(201).send({
      status: "success",
      paymentId,
      waveLaunchUrl,
    });
  } catch (error) {
    logger.error("Erreur dans createPaymentSession", error);
    res.status(500).send({ error: "Erreur interne du serveur" });
  }
});

/**
 * Fonction: initiatePayment
 * Description: Simule une initialisation de paiement.
 */
exports.initiatePayment = onRequest((req, res) => {
  logger.info("Requête reçue pour initiatePayment", {structuredData: true});

  try {
    if (req.method !== "POST") {
      return res.status(405).send({ error: "Méthode non autorisée" });
    }

    const { amount, userId } = req.body;

    if (!amount || !userId) {
      return res.status(400).send({ error: "Paramètres manquants ou invalides" });
    }

    const paymentId = `init_${Date.now()}`;

    res.status(201).send({
      status: "success",
      paymentId,
      message: `Paiement de ${amount} initialisé pour l'utilisateur ${userId}`,
    });
  } catch (error) {
    logger.error("Erreur dans initiatePayment", error);
    res.status(500).send({ error: "Erreur interne du serveur" });
  }
});

