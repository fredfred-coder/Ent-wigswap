# Utiliser l'image officielle de Node.js
FROM node:18

# Définir le répertoire de travail à l'intérieur du conteneur
WORKDIR /usr/src/app

# Copier les fichiers package.json et package-lock.json (s'ils existent)
COPY package*.json ./

# Installer les dépendances nécessaires
RUN npm install

# Copier tous les fichiers de l'application dans le conteneur
COPY . .

# Exposer le port sur lequel l'application va écouter
EXPOSE 5006

# Commande pour lancer l'application
CMD ["npm", "start"]

