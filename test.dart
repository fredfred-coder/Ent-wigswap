import 'package:url_launcher/url_launcher.dart';

void main() async {
  // Exemple de chaîne
  var variable = "Hello"; 
  print(variable.runtimeType); // Devrait afficher "String"

  // Exemple de réponse d'API (remplacez-le par votre code réel)
  var response = {
    'wave_launch_url': "https://pay.wave.com/c/cos-1sed01k08128c?a=1000&c=XOF&m=Fred%20Trade%20Senegal"
  };

  // Vérifiez le type de la variable
  String waveLaunchUrl = response['wave_launch_url'];
  print('Type de waveLaunchUrl: ${waveLaunchUrl.runtimeType}'); // Devrait afficher "String"

  // Lancer la page de paiement
  await launchPaymentPage(waveLaunchUrl);
}

// Fonction pour lancer l'URL
Future<void> launchPaymentPage(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
