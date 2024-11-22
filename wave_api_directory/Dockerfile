# Utiliser une image de base de Node.js si ton API Wave utilise Node.js
FROM node:18

# Créer un répertoire de travail
WORKDIR /usr/src/app

# Copier les fichiers package.json et package-lock.json dans le répertoire de travail
# Cela permet de tirer parti du cache Docker lors de l'installation des dépendances
COPY package*.json ./

# Installer les dépendances nécessaires
RUN npm install

# Copier le reste de l'application dans le répertoire de travail
COPY . .

# Exposer le port sur lequel l'application va écouter
EXPOSE 8000

# Démarrer l'application
CMD ["npm", "start"]

