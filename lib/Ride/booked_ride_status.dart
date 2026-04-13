import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:waybuddy/Ride/ride_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RideBookedScreen(),
    );
  }
}

class RideBookedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 2,
        title: Text(
          "WayBuddy",
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 20),
              Text(
                "Your ride has been successfully booked!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Ride details will be shared with you shortly.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookedRideDetailsPage(),
                      ));
                },
                child: Text(
                  "Get Ride Details",
                  style: TextStyle(fontSize:16,color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF63A9FC),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
