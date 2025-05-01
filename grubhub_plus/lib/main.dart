// ignore_for_file: constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase Core
//import 'splash_screen.dart'; // SplashScreen - commented out to fix error
// import 'home_screen.dart';    // HomeScreen
// import 'auth_screen.dart';    // AuthScreen

// A simple flag to control Firebase initialization (for testing)
const USE_FIREBASE = true; // Change to 'true' if you're using Firebase

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase (if needed)
  if (USE_FIREBASE) {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print("Error initializing Firebase: $e");
      // Handle error appropriately
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grubhub+', // app's name
      theme: ThemeData(
        primarySwatch: Colors.blue, // Corrected line: using Colors.blue
        // You can define more theme properties here
      ),
      // Define routes for navigation
      routes: {
        '/splash': (context) =>
            const SplashScreen(), // added SplashScreen() back, assuming it is needed.
        '/home': (context) => const HomeScreen(),
        '/auth': (context) => const AuthScreen(),
      },
      initialRoute:
          '/splash', // Set the initial screen to SplashScreen.  Make sure you have a SplashScreen
      //home: SplashScreen(), // You can also use 'home:' but routes are generally preferred
    );
  }
}

// **Important: Replace these with your actual screen implementations**
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: const Center(child: Text('Login / Signup')),
    );
  }
}

class SplashScreen extends StatelessWidget {
  // Add this back, and implement your splash screen here.
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}