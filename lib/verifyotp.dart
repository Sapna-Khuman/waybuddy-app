import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waybuddy/newpass.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OTPVerificationScreen(),
  ));
}

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  int secondsRemaining = 30;
  bool canResend = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
        setState(() {
          canResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO IMAGE
            SizedBox(
              height: 120, // Adjust height as needed
              child: Image.asset(
                "assets/logo.png", // Replace with your logo file path
                fit: BoxFit.contain,
              ),
            ),

            const Text(
              "Verification",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Enter the 5-digit verification code sent to your number.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              maxLength: 5,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPasswordPage()),
                  );
                  print("Entered OTP: ${otpController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF63A9FC),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: canResend
                  ? () {
                setState(() {
                  secondsRemaining = 30;
                  canResend = false;
                });
                timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                  if (secondsRemaining > 0) {
                    setState(() {
                      secondsRemaining--;
                    });
                  } else {
                    timer.cancel();
                    setState(() {
                      canResend = true;
                    });
                  }
                });
                print("Resending OTP...");
              }
                  : null,
              child: Text(
                canResend ? "Resend Code" : "Resend Code in $secondsRemaining s",
                style: TextStyle(fontSize: 14, color: canResend ? Colors.blue : Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
