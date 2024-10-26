/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Utiliser logger pour enregistrer un message
logger.info("Fonctions Firebase prêtes pour le déploiement.");

// Créer et déployer votre première fonction
// https://firebase.google.com/docs/functions/get-started

// Exemple de fonction utilisant onRequest
exports.helloWorld = onRequest((request, response) => {
  logger.info("Requête reçue sur helloWorld");
  response.send("Hello, world!");
});

