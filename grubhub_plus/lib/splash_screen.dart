// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // For the loading indicator
// import 'home_screen.dart'; // Import your home screen
// import 'auth_screen.dart'; // Import your authentication screen
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart'; // If you're using Firebase Auth

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Simulate some initial loading or checks (e.g., Firebase Auth state)
    await Future.delayed(const Duration(seconds: 3)); // Adjust the duration as needed

    // Check if the user is logged in (if using Firebase Auth)
    if (USE_FIREBASE) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/auth');
      }
    } else {
      // If not using authentication, navigate directly to the home screen
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your GrubHub-like logo and text
            Image.asset(
              'assets/grubhub_logo.png', // Replace with the actual path to your image
              height: 80.0, // Adjust the height as needed
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Campus Eats, Delivered Fast!',
              style: TextStyle(
                color: Colors.black54, // Adjust the color as needed
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 32.0),
            // Gmail-like loading indicator
            const SpinKitThreeBounce(
              color: Colors.blueAccent, // Customize the color
              size: 30.0, // Adjust the size
            ),
          ],
        ),
      ),
    );
  }
}