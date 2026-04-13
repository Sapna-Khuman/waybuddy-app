import 'package:flutter/material.dart';
import 'package:waybuddy/signin_signup/signin.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  String? _gender = 'Male';

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sign Up Text & Image
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Join WayBuddy Today!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // Pushes image to the right
                  Image.asset(
                    "assets/logo.png", // Replace with your actual image path
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Form Fields
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // First & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              hintText: "First Name",
                              prefixIcon: Icon(Icons.person,color: Colors.grey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              prefixIcon: Icon(Icons.person_outline,color: Colors.grey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Date of Birth
                    TextField(
                      controller: _dobController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        hintText: "Date of Birth",
                        prefixIcon: Icon(Icons.calendar_today,color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Profession
                    TextField(
                      controller: _professionController,
                      decoration: InputDecoration(
                        hintText: "Profession",
                        prefixIcon: Icon(Icons.work,color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Gender Dropdown
                    DropdownButtonFormField<String>(
                      value: _gender,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        prefixIcon: Icon(Icons.wc,color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      items: ['Male', 'Female'].map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        prefixIcon: Icon(Icons.email,color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Contact Number
                    TextField(
                      controller: _contactNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        prefixIcon: Icon(Icons.phone,color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF63A9FC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Already Have an Account? Sign In

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
