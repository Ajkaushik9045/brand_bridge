import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;

    if (!hasSeenSplash) {
      // If splash screen hasn't been seen, show it and set the flag
      await prefs.setBool('hasSeenSplash', true);
      await Future.delayed(const Duration(seconds: 2));
    }

    // After the splash screen, navigate to the AuthGate
    Navigator.pushReplacementNamed(context, '/AuthGate');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff09203f),
              Color(0xff537895),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Text(
            "Brand Bridge",
            style: TextStyle(fontSize: 34, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
