import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pat/welcome.dart';

import 'firebase_options.dart';
void main() async {
  // Initializing Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WelcomePage(),
    );
  }

}