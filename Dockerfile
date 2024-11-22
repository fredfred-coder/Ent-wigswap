FROM node:18  # Utilise Node.js 18, ajustez si nécessaire
WORKDIR /app  # Définir le répertoire de travail
COPY . /app   # Copier tout le contenu du répertoire dans le conteneur
RUN npm install  # Installer les dépendances de Node.js
EXPOSE 3000  # Le port sur lequel votre API écoute (ajustez si nécessaire)
CMD ["npm", "start"]  # Commande de démarrage

