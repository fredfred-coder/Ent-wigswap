import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

dynamic preparePostData() {
  Map<String, dynamic> preparePostData(Map<String, dynamic> data) {
    // Convertir la chaîne 'amount' en un nombre avant de l'envoyer
    data['amount'] = double.tryParse(data['amount'] ?? '1000') ?? 1000;

    // Assigner des valeurs par défaut aux champs qui peuvent être manquants
    data['userId'] = data['userId'] ?? '';
    data['paiementId'] = data['paiementId'] ?? '';

    // Ajouter le statut avec une valeur par défaut de 'pending'
    data['status'] = data['status'] ?? 'pending';

    return data;
  }
}

double? amountJson() {
  double convertAmountToDouble(dynamic amountJson) {
    try {
      return double.parse(amountJson.toString());
    } catch (e) {
      return 0.0; // Retourne 0 si la conversion échoue.
    }
  }
}
