import 'dart:async';

import 'package:flutter/material.dart';
import 'package:waybuddy/signin_signup/signin.dart';

class splase_screen extends StatefulWidget {
  const splase_screen({super.key});

  @override
  State<splase_screen> createState() => _splase_screenState();
}

class _splase_screenState extends State<splase_screen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100], // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        // Image
        Expanded(
        flex: 3,
        child: Center(
          child: Image.asset(
            "assets/logo.png", // Replace with your actual image filename
            fit: BoxFit.contain,
            width: 250,
          ),
        ),
      ),

          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  "Connect. Commute. Conserve.", // Your tagline
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 5), // Spacing
                CircularProgressIndicator(
                  color: Colors.black, // Loading indicator
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
