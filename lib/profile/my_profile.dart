import 'package:flutter/material.dart';
import 'package:waybuddy/profile/edit_profile_detail.dart';
import 'package:waybuddy/signin_signup/Sign_up.dart';
import 'package:waybuddy/signin_signup/signin.dart';
import 'package:waybuddy/home.dart';
import 'package:waybuddy/activity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.black12,
        elevation: 0,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.settings, color: Colors.black),
        //     onPressed: () {
        //       // Navigate to settings screen
        //     },
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add_photo_alternate, size: 40, color: Color(0xFF63A9FC)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sapna Khuman",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Color(0xFF63A9FC),
                      );
                    }),
                  ),
                  const Text(
                    "Complete Your Profile",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Edit", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  // Profile Option 1: My Profile
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, size: 30, color: Colors.grey),
                            SizedBox(width: 15),
                            Text("My Profile", style: TextStyle(fontSize: 16, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black, size: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),

                  // Profile Option 2: Member Since
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 30, color: Colors.grey),
                            SizedBox(width: 15),
                            Text("Member Since", style: TextStyle(fontSize: 16, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black, size: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),

                  // Profile Option 3: Invite a Friend
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.group, size: 30, color: Colors.grey),
                            SizedBox(width: 15),
                            Text("Invite a Friend", style: TextStyle(fontSize: 16, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.arrow_forward, size: 30, color: Colors.black),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.settings, size: 30, color: Colors.grey),
                            SizedBox(width: 15),
                            Text("Setting", style: TextStyle(fontSize: 16, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.arrow_forward, color: Colors.black, size: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),

                  // Profile Option 4: Logout with Confirmation
                  ElevatedButton(
                    onPressed: () {
                      _showLogoutConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout, size: 30, color: Colors.grey),
                            SizedBox(width: 15),
                            Text("Logout", style: TextStyle(fontSize: 16, color: Colors.black)),
                          ],
                        ),
                        Icon(Icons.arrow_forward, size: 30, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF63A9FC),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(Icons.home, "Home", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
            _buildNavButton(Icons.local_activity_sharp, "Activity", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityPage()));
            }),
            _buildNavButton(Icons.person, "Account", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
            }),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavButton(IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, elevation: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
