import 'package:flutter/material.dart';
import 'package:waybuddy/splase/splase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: splase_screen(),
    );
  }
}

