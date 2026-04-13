import 'package:flutter/material.dart';
import 'package:waybuddy/Ride/booked_ride_status.dart';
import 'package:waybuddy/map.dart';

class RideBookingScreen extends StatefulWidget {
  @override
  _RideBookingScreenState createState() => _RideBookingScreenState();
}

class _RideBookingScreenState extends State<RideBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _startLocationController =
      TextEditingController();
  final TextEditingController _dropLocationController = TextEditingController();
  final TextEditingController _amountController =
      TextEditingController(text: "100");
  final TextEditingController _commentController = TextEditingController(
      text: "I want to reach GLS University at 08:00 AM on time.");
  String? _selectedTolerance = "15+ Min";
  String? _selectedGender = "Male";
  String? _selectedPaymentMethod = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Plan Your Ride",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 50, // Set desired width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Map()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF63A9FC),
                        // Button background color
                        foregroundColor: Colors.white,
                        // Text color
                        padding: EdgeInsets.symmetric(vertical: 16),
                        // More vertical space
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                        ),
                        elevation: 5, // Adds a subtle shadow
                      ),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height:30,),
              _buildTextField("Enter Start Location", Icons.location_on,
                  _startLocationController),
              const SizedBox(height: 16),
              _buildTextField("Enter Drop Location", Icons.location_on_outlined,
                  _dropLocationController),
              const SizedBox(height: 16),
              _buildDropdown(
                  "Tolerance",
                  _selectedTolerance,
                  ["5 Min", "10 Min", "15+ Min"],
                  (val) => setState(() => _selectedTolerance = val)),
              const SizedBox(height: 16),
              _buildGenderSelection(),
              const SizedBox(height: 16),
              _buildTextField("Enter Amount", Icons.currency_rupee_sharp,
                  _amountController),
              const SizedBox(height: 16),
              _buildTextField(
                  "Add Coupon Code if Any", Icons.card_giftcard, null),
              const SizedBox(height: 16),
              _buildTextField("Comment", Icons.comment, _commentController),
              const SizedBox(height: 24),
              _buildBookRideButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hint, IconData icon, TextEditingController? controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text("Gender", style: TextStyle(fontSize: 16)),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text("Male"),
                value: "Male",
                groupValue: _selectedGender,
                onChanged: (value) => setState(() => _selectedGender = value),
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const Text("Female"),
                value: "Female",
                groupValue: _selectedGender,
                onChanged: (value) => setState(() => _selectedGender = value),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBookRideButton() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            _showBookingConfirmationDialog();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF63A9FC),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            "Book Ride",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showBookingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Booking"),
          content: const Text("Payment is accepteed only in UPI"),
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
}
