import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserDetailScreen(),
    );
  }
}

class UserDetailScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserDetailScreen> {
  String profileImage = "https://via.placeholder.com/150";
  String userName = "Sapna Khuman";
  String userEmail = "sapna23@gmail.com";
  String userPhone = "+91 93030 45654";
  String userAddress = "23 Main Street,Ahmedabad";
  String userDob = "January 1, 2025";

  void _editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          userName: userName,
          userEmail: userEmail,
          userPhone: userPhone,
          userAddress: userAddress,
          userDob: userDob,
        ),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        userName = result['name'] ?? userName;
        userEmail = result['email'] ?? userEmail;
        userPhone = result['phone'] ?? userPhone;
        userAddress = result['address'] ?? userAddress;
        userDob = result['dob'] ?? userDob;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold),),

        backgroundColor: Colors.black12,
        actions: [

          // IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: _editProfile,
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profileImage),
              ),
            ),
            SizedBox(height: 15),

            // Name
            Text(
              userName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Email
            Text(
              userEmail,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            SizedBox(height: 20),

            // Profile Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileDetail(Icons.phone, "Phone", userPhone),
                  _buildProfileDetail(Icons.location_on, "Address", userAddress),
                  _buildProfileDetail(Icons.calendar_today, "Date of Birth", userDob),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _editProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF63A9FC),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Edit Profile",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetail(IconData icon, String title, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final String userName, userEmail, userPhone, userAddress, userDob;

  EditProfileScreen({
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userAddress,
    required this.userDob,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userName);
    emailController = TextEditingController(text: widget.userEmail);
    phoneController = TextEditingController(text: widget.userPhone);
    addressController = TextEditingController(text: widget.userAddress);
    dobController = TextEditingController(text: widget.userDob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",style:  TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField("Full Name", nameController),
            _buildTextField("Email", emailController),
            _buildTextField("Phone", phoneController),
            _buildTextField("Full Address", addressController),
            _buildTextField("Date of Birth", dobController),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    "name": nameController.text,
                    "email": emailController.text,
                    "phone": phoneController.text,
                    "address": addressController.text,
                    "dob": dobController.text,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF63A9FC) ,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Save Changes",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),),
        );
    }
}
