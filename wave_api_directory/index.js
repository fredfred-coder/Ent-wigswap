const express = require('express');
const app = express();
const port = 8000;

app.get('/', (req, res) => {
    res.send('Hello from Wave API!');
});

app.listen(port, () => {
    console.log(`Wave API listening at http://localhost:${port}`);
});

