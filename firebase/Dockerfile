# Dockerfile pour créer une image Firebase Emulator
FROM node:14

RUN npm install -g firebase-tools

# Commande par défaut
CMD ["firebase", "emulators:start", "--only", "firestore,functions,auth"]

