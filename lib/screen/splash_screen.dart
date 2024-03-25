import 'dart:async';

import 'package:flutter/material.dart';

import '../bottmbar/bottam_navigation.dart';
import '../login_screen/login.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add a delay to simulate a splash screen duration
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the home page after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/21.gif',fit: BoxFit.fill,),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
