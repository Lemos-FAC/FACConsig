import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBmDE9Y_0XUg2UeknhVCmVZiyG2ewxaPBM",
            authDomain: "f-a-c-consig-tsru4z.firebaseapp.com",
            projectId: "f-a-c-consig-tsru4z",
            storageBucket: "f-a-c-consig-tsru4z.firebasestorage.app",
            messagingSenderId: "190077840547",
            appId: "1:190077840547:web:5b600260ea2cb1106ee316",
            measurementId: "G-BJC0WTNC98"));
  } else {
    await Firebase.initializeApp();
  }
}
