const functions = require("firebase-functions");

exports.initiatePayment = functions.https.onRequest((req, res) => {
  // Ajout des logs pour inspecter les en-têtes et le corps de la requête
  console.log("Headers reçus :", req.headers);
  console.log("Body reçu brut :", req.rawBody ? req.rawBody.toString() : "Aucun corps reçu");
  
  // Vérifier le type du corps de la requête
  console.log("Type du corps de la requête :", typeof req.body);

  // Vérifier le corps de la requête
  console.log("Payment initiation request received");
  console.log("Request body:", req.body);

  // Extraire et loguer chaque champ individuel
  const {
    status,
    amount,
    phoneNumber,
    userId,
    username,
    paiementId,
    date,
    currency,
    success_url,
    error_url,
  } = req.body;

  console.log("Statut:", status);
  console.log("Montant:", amount);
  console.log("Numéro de téléphone:", phoneNumber);
  console.log("UserId:", userId);
  console.log("Username:", username);
  console.log("PaiementId:", paiementId);
  console.log("Date:", date);
  console.log("Devise:", currency);
  console.log("URL en cas de succès:", success_url);
  console.log("URL en cas d'erreur:", error_url);

  // Vérification des paramètres obligatoires
  if (
    !status ||
    !amount ||
    !phoneNumber ||
    !userId ||
    !username ||
    !paiementId ||
    !date ||
    !currency ||
    !success_url ||
    !error_url
  ) {
    console.error("Erreur : Paramètres manquants dans la requête");
    return res.status(400).send({ message: "Paramètres manquants" });
  }

  console.log("Tous les paramètres sont présents. Paiement initié avec succès.");

  // Répondre avec succès
  res.status(200).send({
    message: "Payment initiation successful",
    status,
    amount,
    phoneNumber,
    userId,
    username,
    paiementId,
    date,
    currency,
    success_url,
    error_url,
  });
});

