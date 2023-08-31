import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/responsi/Responsive%20.dart';
import 'package:flutter_application_19/responsi/mobail/mobail.dart';
import 'package:flutter_application_19/responsi/web/web.dart';

import 'responsi/mobail/screens/register.dart';
import 'responsi/mobail/screens/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDge8mMsQnEx5nT85w6Gg-usqoGL3QIy_M",
            authDomain: "fir-setup-3ee22.firebaseapp.com",
            projectId: "fir-setup-3ee22",
            storageBucket: "fir-setup-3ee22.appspot.com",
            messagingSenderId: "726611463227",
            appId: "1:726611463227:web:6d325bcfc32b5bb71c201e"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Register(),
    );
  }
}
