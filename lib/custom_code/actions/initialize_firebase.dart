// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: _getFirebaseOptions(),
  );
}

FirebaseOptions _getFirebaseOptions() {
  if (kIsWeb) {
    return FirebaseOptions(
        apiKey: "AIzaSyBmDE9Y_0XUg2UeknhVCmVZiyG2ewxaPBM",
        authDomain: "f-a-c-consig-tsru4z.firebaseapp.com",
        projectId: "f-a-c-consig-tsru4z",
        storageBucket: "f-a-c-consig-tsru4z.firebasestorage.app",
        messagingSenderId: "190077840547",
        appId: "1:190077840547:web:5b600260ea2cb1106ee316",
        measurementId: "G-BJC0WTNC98");
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return FirebaseOptions(
          apiKey: "AIzaSyBmDE9Y_0XUg2UeknhVCmVZiyG2ewxaPBM",
          authDomain: "f-a-c-consig-tsru4z.firebaseapp.com",
          projectId: "f-a-c-consig-tsru4z",
          storageBucket: "f-a-c-consig-tsru4z.firebasestorage.app",
          messagingSenderId: "190077840547",
          appId: "1:190077840547:web:5b600260ea2cb1106ee316",
          measurementId: "G-BJC0WTNC98");
    case TargetPlatform.iOS:
      return FirebaseOptions(
          apiKey: "AIzaSyBmDE9Y_0XUg2UeknhVCmVZiyG2ewxaPBM",
          authDomain: "f-a-c-consig-tsru4z.firebaseapp.com",
          projectId: "f-a-c-consig-tsru4z",
          storageBucket: "f-a-c-consig-tsru4z.firebasestorage.app",
          messagingSenderId: "190077840547",
          appId: "1:190077840547:web:5b600260ea2cb1106ee316",
          measurementId: "G-BJC0WTNC98");
    default:
      throw UnsupportedError(
        'FirebaseOptions are not supported for this platform.',
      );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
