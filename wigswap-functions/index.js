/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const express = require('express');  // Importer Express pour créer une application API

// Créer une instance Express
const app = express();

// Ajouter une route GET pour '/v1/payment/session'
app.get('/v1/payment/session', (req, res) => {
    logger.info("Requête reçue pour /v1/payment/session", { structuredData: true });
    res.status(200).json({ message: "API Wave: Session active" });
});

// Exporter l'application Express en tant que fonction HTTP
exports.api = onRequest(app);

