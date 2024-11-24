const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Fonction POST pour initier le paiement
exports.initiatePayment = onRequest((request, response) => {
    if (request.method !== "POST") {
        logger.error("Méthode non autorisée. Seul POST est autorisé.");
        response.status(405).send("Method Not Allowed");
        return;
    }

    // Logs pour déboguer la requête reçue
    logger.info("Payment initiation request received");
    logger.info(`Request body: ${JSON.stringify(request.body)}`);

    // Assurez-vous que les paramètres nécessaires sont bien présents
    const { status, amount, phoneNumber, userId, username, paiementId, date, currency, success_url, error_url } = request.body;

    if (!status || !amount || !phoneNumber || !userId || !username || !paiementId || !date || !currency || !success_url || !error_url) {
        logger.error("Erreur: Certains paramètres sont manquants dans la requête.");
        response.status(400).send("Bad Request: Missing required parameters");
        return;
    }

    // Ajouter des logs supplémentaires pour vérifier chaque paramètre reçu
    logger.info(`Status: ${status}`);
    logger.info(`Amount: ${amount}`);
    logger.info(`PhoneNumber: ${phoneNumber}`);
    logger.info(`UserId: ${userId}`);
    logger.info(`Username: ${username}`);
    logger.info(`PaiementId: ${paiementId}`);
    logger.info(`Date: ${date}`);
    logger.info(`Currency: ${currency}`);
    logger.info(`Success URL: ${success_url}`);
    logger.info(`Error URL: ${error_url}`);

    // Simule une réponse de succès
    logger.info("Tous les paramètres sont présents. Paiement initié avec succès.");
    response.status(200).send({
        message: "Payment initiation successful",
        status: status,
        amount: amount,
        phoneNumber: phoneNumber,
        userId: userId,
        username: username,
        paiementId: paiementId,
        date: date,
        currency: currency,
        success_url: success_url,
        error_url: error_url
    });
});

