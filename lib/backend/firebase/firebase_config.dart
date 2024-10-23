import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBx_qqmROz0HR0OdcabTRbryT14HYPmGq8",
            authDomain: "wigswap-274ff.firebaseapp.com",
            projectId: "wigswap-274ff",
            storageBucket: "wigswap-274ff.appspot.com",
            messagingSenderId: "920564303895",
            appId: "1:920564303895:web:776314971f42d8cab4b452",
            measurementId: "G-RZN5D4RR82"));
  } else {
    await Firebase.initializeApp();
  }
}
