import 'package:flutter/material.dart';
import 'package:waybuddy/Ride/find_ride.dart';
import 'package:waybuddy/home.dart';

class BookedRideDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Booked Ride Details',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailCard(Icons.location_on, 'Pickup Location',
                '123 Main Street, City Center'),
            _buildDetailCard(
                Icons.flag, 'Drop-off Location', 'GLS University, Downtown'),
            _buildDetailCard(Icons.access_time, 'Estimated Arrival',
                'Arriving in 5 mins', Colors.green),
            _buildDetailCard(Icons.money, 'Fare', '₹100 (Cash)'),
            SizedBox(height: 16),
            _buildDriverInfo(),
            SizedBox(height: 24),
            _buildActionButton(
                Icons.phone, 'Call Driver', Color(0xFF63A9FC), () {}),
            SizedBox(height: 12),
            _buildActionButton(Icons.cancel, 'Cancel Ride', Color(0xFF63A9FC),
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String title, String value,
      [Color? valueColor]) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text(value, style: TextStyle(color: valueColor ?? Colors.black)),
      ),
    );
  }

  Widget _buildDriverInfo() {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.person, color: Colors.blue),
        ),
        title: Text('Vehicle Owner: Rahul Dave',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text('Vehicle: Activa 5G (White)\nLicense Plate: GJ 01 BH 8989'),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        icon: Icon(icon),
        label: Text(text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }
}
