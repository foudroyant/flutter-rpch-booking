import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCaTRUCnmNsO8PCZ3CFCndKdyhFsyU3fkQ",
            authDomain: "rpch-booking-49ca9.firebaseapp.com",
            projectId: "rpch-booking-49ca9",
            storageBucket: "rpch-booking-49ca9.appspot.com",
            messagingSenderId: "731810484924",
            appId: "1:731810484924:web:8a12f81a279b51eae136b9"));
  } else {
    await Firebase.initializeApp();
  }
}
