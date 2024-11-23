// Importer Express
const express = require('express');
const app = express();
const port = 8000;

// Route GET pour l'API Wave
app.get('/api/get_payment_info', (req, res) => {
    res.send({ message: 'Hello from Wave API!' });
});

// Démarrer le serveur
app.listen(port, () => {
    console.log(`Wave API listening at http://localhost:${port}`);
});

