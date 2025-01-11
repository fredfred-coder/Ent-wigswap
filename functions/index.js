const { onRequest } = require("firebase-functions/v2/https");
const admin = require("firebase-admin");
const crypto = require("crypto");
const Joi = require("joi");
const { logger } = require("firebase-functions");
require('dotenv').config();

// ✅ Initialisation Firebase
if (!admin.apps.length) {
    admin.initializeApp();
}

// ✅ Chargement sécurisé des variables d'environnement
const CONFIG = {
    WEBHOOK_SECRET: process.env.WEBHOOK_SECRET,
    WAVE_BASE_URL: process.env.WAVE_BASE_URL || "https://pay.wave.com",
    AUTH_KEY: process.env.AUTH_KEY || "secret-key",
};

if (!CONFIG.WEBHOOK_SECRET) {
    throw new Error("⚠️ WEBHOOK_SECRET non défini dans les variables d'environnement.");
}

// ✅ Statuts de paiement et transitions sécurisées
const PAYMENT_STATUSES = {
    PENDING: "pending",
    COMPLETED: "completed",
    FAILED: "failed",
    CANCELED: "canceled",
};

const VALID_STATUS_TRANSITIONS = {
    pending: ["completed", "failed", "canceled"],
    completed: [],
    failed: ["pending"],
    canceled: ["pending"],
};

/**
 * ✅ Vérification des transitions de statut valides
 * @param {string} currentStatus - Statut actuel du paiement
 * @param {string} newStatus - Nouveau statut à appliquer
 * @returns {boolean} - Retourne true si la transition est valide, sinon false.
 */
const isValidStatusTransition = (currentStatus, newStatus) => {
    return VALID_STATUS_TRANSITIONS[currentStatus]?.includes(newStatus) || false;
};

/**
 * ✅ Fonction pour valider la signature du Webhook
 * @param {Object} req - La requête HTTP entrante.
 * @returns {boolean} - Retourne true si la signature est valide, sinon false.
 */
const isValidSignature = (req) => {
    try {
        const receivedSignature = req.headers["x-wave-signature"];
        if (!receivedSignature) {
            logger.warn("❗ Signature manquante.");
            return false;
        }
        const sortedBody = JSON.stringify(req.body, Object.keys(req.body).sort());
        const calculatedSignature = crypto
            .createHmac("sha256", CONFIG.WEBHOOK_SECRET)
            .update(sortedBody)
            .digest("hex");
        return receivedSignature === calculatedSignature;
    } catch (error) {
        logger.error("❌ Erreur de validation de signature :", error);
        return false;
    }
};

// ✅ Schéma de validation Joi pour les paiements
const paymentSchema = Joi.object({
    userId: Joi.string().required(),
    amount: Joi.number().positive().greater(100).required(),
    currency: Joi.string().length(3).required(),
    success_url: Joi.string().uri().required(),
    error_url: Joi.string().uri().required(),
});

/**
 * ✅ Créer une session de paiement Wave
 * @param {Object} req - Requête HTTP entrante avec les données de paiement.
 * @param {Object} res - Réponse HTTP sortante.
 */
exports.createPaymentSession = onRequest(async (req, res) => {
    try {
        logger.info("➡️ Requête reçue pour createPaymentSession", { body: req.body });

        const { error, value } = paymentSchema.validate(req.body);
        if (error) {
            logger.warn("❗ Erreur de validation :", error.details[0].message);
            return res.status(400).send({ error: error.details[0].message, code: "invalid_request_data" });
        }

        const { userId, amount, currency, success_url, error_url } = value;
        const paymentId = `pay_${Date.now()}`;
        const waveLaunchUrl = `${CONFIG.WAVE_BASE_URL}/c/${paymentId}?a=${amount}&c=${currency}`;

        await admin.firestore().collection("paiement").doc(paymentId).set({
            userId,
            amount,
            currency,
            waveLaunchUrl,
            success_url,
            error_url,
            status: PAYMENT_STATUSES.PENDING,
            statusHistory: [{ status: PAYMENT_STATUSES.PENDING, updatedAt: admin.firestore.FieldValue.serverTimestamp() }],
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });

        logger.info(`✅ Session de paiement créée avec succès : ${paymentId}`);
        res.status(200).send({ status: "success", paymentId, waveLaunchUrl });
    } catch (error) {
        logger.error("❌ Erreur dans createPaymentSession :", error);
        res.status(500).send({ error: `Erreur serveur : ${error.message}`, code: "server_error" });
    }
});

/**
 * ✅ Webhook pour la gestion des paiements Wave
 * @param {Object} req - Requête HTTP entrante contenant le Webhook.
 * @param {Object} res - Réponse HTTP sortante.
 */
exports.paymentWebhooks = onRequest(async (req, res) => {
    try {
        logger.info("➡️ Webhook reçu", { body: req.body });

        if (!isValidSignature(req)) {
            logger.warn("❗ Signature Webhook invalide détectée.");
            return res.status(401).send({ error: "Signature Webhook invalide.", code: "invalid_signature" });
        }

        const { paymentId, status } = req.body;

        if (!paymentId || !status) {
            logger.warn("❗ Données Webhook incomplètes.");
            return res.status(400).send({ error: "Le paymentId et le statut sont requis.", code: "invalid_webhook_data" });
        }

        const paymentRef = admin.firestore().collection("paiement").doc(paymentId);
        const paymentDoc = await paymentRef.get();

        if (!paymentDoc.exists) {
            logger.warn("❗ Paiement non trouvé :", paymentId);
            return res.status(404).send({ error: "Paiement introuvable.", code: "payment_not_found" });
        }

        const currentStatus = paymentDoc.data().status;
        if (!isValidStatusTransition(currentStatus, status)) {
            logger.warn(`❗ Transition de statut invalide : ${currentStatus} -> ${status}`);
            return res.status(400).send({ error: "Transition de statut invalide.", code: "invalid_status_transition" });
        }

        await paymentRef.update({
            status,
            statusHistory: admin.firestore.FieldValue.arrayUnion({
                status,
                updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            }),
        });

        logger.info(`✅ Statut du paiement mis à jour : ${status}`);
        res.status(200).send({ message: "Webhook traité avec succès.", code: "webhook_success" });
    } catch (error) {
        logger.error("❌ Erreur dans paymentWebhooks :", error);
        res.status(500).send({ error: `Erreur serveur : ${error.message}`, code: "server_error" });
    }
});

