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

// ✅ Vérification des transitions de statut valides
const isValidStatusTransition = (currentStatus, newStatus) => {
    return VALID_STATUS_TRANSITIONS[currentStatus]?.includes(newStatus) || false;
};

// ✅ Validation de la signature Webhook
const isValidSignature = (req) => {
    try {
        const receivedSignature = req.headers["x-wave-signature"];
        if (!receivedSignature) {
            logger.warn("❗ Signature manquante.");
            return false;
        }
        const calculatedSignature = crypto
            .createHmac("sha256", CONFIG.WEBHOOK_SECRET)
            .update(JSON.stringify(req.body))
            .digest("hex");
        return receivedSignature === calculatedSignature;
    } catch (error) {
        logger.error("❌ Erreur de validation de signature :", error);
        return false;
    }
};

// ✅ Schéma de validation des paiements
const paymentSchema = Joi.object({
    userId: Joi.string().required(),
    amount: Joi.number().positive().greater(0).required(),
    currency: Joi.string().length(3).required(),
    success_url: Joi.string().uri().required(),
    error_url: Joi.string().uri().required(),
});

// ✅ Créer une session de paiement
exports.createPaymentSession = onRequest(async (req, res) => {
    try {
        logger.info("➡️ Requête reçue pour createPaymentSession", { body: req.body });

        const { error, value } = paymentSchema.validate(req.body);
        if (error) {
            logger.warn("❗ Erreur de validation :", error.details[0].message);
            return res.status(400).send({ error: error.details[0].message });
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
        res.status(500).send({ error: `Erreur serveur : ${error.message}` });
    }
});

// ✅ Gestion des Webhooks Wave
exports.paymentWebhooks = onRequest(async (req, res) => {
    try {
        logger.info("➡️ Webhook reçu", { body: req.body });

        if (!isValidSignature(req)) {
            logger.warn("❗ Signature Webhook invalide détectée.");
            return res.status(401).send({ error: "Signature Webhook invalide." });
        }

        const { paymentId, status } = req.body;
        if (!paymentId || !status) {
            logger.warn("❗ Données Webhook incomplètes.");
            return res.status(400).send({ error: "Le paymentId et le statut sont requis." });
        }

        const paymentRef = admin.firestore().collection("paiement").doc(paymentId);
        const paymentDoc = await paymentRef.get();

        if (!paymentDoc.exists) {
            logger.warn("❗ Paiement non trouvé :", paymentId);
            return res.status(404).send({ error: "Paiement introuvable." });
        }

        const currentStatus = paymentDoc.data().status;
        if (!isValidStatusTransition(currentStatus, status)) {
            logger.warn(`❗ Transition de statut invalide : ${currentStatus} -> ${status}`);
            return res.status(400).send({ error: "Transition de statut invalide." });
        }

        await paymentRef.update({
            status,
            statusHistory: admin.firestore.FieldValue.arrayUnion({
                status,
                updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            }),
        });

        logger.info(`✅ Statut du paiement mis à jour : ${status}`);
        res.status(200).send({ message: "Webhook traité avec succès." });
    } catch (error) {
        logger.error("❌ Erreur dans paymentWebhooks :", error);
        res.status(500).send({ error: `Erreur serveur : ${error.message}` });
    }
});

