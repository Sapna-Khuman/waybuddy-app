import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waybuddy/home.dart';
import 'package:waybuddy/profile/my_profile.dart';

void main() {
  runApp(MyApp());
}

/// This is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Activity',
          style: GoogleFonts.openSans(
            fontSize: 27,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF63A9FC),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home, color: Colors.black),
                  Text('Home', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // You are already on ActivityPage; optionally avoid navigation loop
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.local_activity_sharp, color: Colors.black),
                  Text('Activity', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.person, color: Colors.black),
                  Text('Account', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 150,
                child: Row(
                  children: [
                    const Image(
                      image: NetworkImage(
                        "https://cdn.bikedekho.com/processedimages/yamaha/mt-15-2-0/source/mt-15-2-06613f885e681c.jpg",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Opp. police station, Ahmedabad",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text("19 Jan  5:18 AM"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
