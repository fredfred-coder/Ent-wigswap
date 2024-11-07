const http = require('http');
const httpProxy = require('http-proxy');

// Créez un proxy
const proxy = httpProxy.createProxyServer({
    ssl: {
        rejectUnauthorized: false // Ignorer les erreurs de certificat
    }
});

// Démarrez un serveur pour gérer les requêtes
const server = http.createServer((req, res) => {
    proxy.web(req, res, { target: 'https://api.wave.com', changeOrigin: true });
});

// Le port que vous souhaitez utiliser pour le proxy
const port = 5001;
server.listen(port, () => {
    console.log(`Proxy en cours d'exécution sur http://localhost:${port}`);
});