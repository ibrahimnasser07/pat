import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pat/login.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.3, 0.6, 0.9],
            colors: [
              Colors.teal,
              Colors.teal.shade400,
              Colors.teal.shade300,
              Colors.tealAccent,
            ],
          ),
        ),
        child: Center(
          child: _isLoading ? Stack(
              alignment: Alignment.center,
              children:
              [
                Image(image: AssetImage("images/Pets World.png")),
                Image(image: AssetImage("images/Homelogo.png")),
              ]
          ) : login()
    ),
      ),
    );
  }
}