# Utiliser une image officielle de Node.js comme image de base
FROM node:18

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers package.json et package-lock.json dans le conteneur
COPY package*.json ./

# Installer les dépendances du projet
RUN npm install

# Installer Firebase CLI globalement
RUN npm install -g firebase-tools

# Copier le reste des fichiers de l'application dans le conteneur
COPY . .

# Exposer le port nécessaire (à adapter selon ton application)
EXPOSE 5001

# Commande à exécuter lorsque le conteneur démarre
CMD ["npm", "start"]


