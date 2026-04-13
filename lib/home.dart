import 'package:flutter/material.dart';
import 'package:waybuddy/Ride/booked_ride_status.dart';
import 'package:waybuddy/Ride/find_ride.dart';
import 'package:waybuddy/Ride/ride_details.dart';
import 'package:waybuddy/activity.dart';
import 'package:waybuddy/profile/my_profile.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 2,
        automaticallyImplyLeading: false,
        title: const Text(
          "WayBuddy",
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildEnterRideDetailsButton(),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/map.jpg",
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Updated calls with pickup parameter
            _buildRideInfoCard(
              name: "Jack",
              pickup: "Opp. police station, Ahmedabad",
              destination: "GLS University",
              fare: "₹50",
            ),
            _buildRideInfoCard(
              name: "David",
              pickup: "Geeta Mandir Bus Stand",
              destination: "Airport",
              fare: "₹80",
            ),
            const SizedBox(height: 20),
            _buildOfferCard(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF63A9FC),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavButton(Icons.home, "Home", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }),
            _buildNavButton(Icons.local_activity_sharp, "Activity", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityPage()),
              );
            }),
            _buildNavButton(Icons.person, "Account", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEnterRideDetailsButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RideBookingScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF63A9FC),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search, color: Colors.white, size: 22),
            SizedBox(width: 8),
            Text(
              "Enter Ride Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Ride Info Card with Pickup, Destination & Fare**
  Widget _buildRideInfoCard({
    required String name,
    required String pickup,
    required String destination,
    required String fare,
  }) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF63A9FC),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Pickup: $pickup',
              style: const TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              'Destination: $destination',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fare: $fare',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      _showAcceptConfirmationDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("ACCEPT", style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAcceptConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Ride"),
          content: const Text("Payment is accepted only in UPI"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RideBookedScreen()),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOfferCard() {
    return Card(
      color: Colors.orangeAccent.shade100,
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Icon(Icons.local_offer, color: Colors.redAccent, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "🚀 Book Your Daily Rides & Get 5% OFF! \nUse Coupon Code: \"Daily5%\"",
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          Text(label, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
