import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/login.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Reset Password"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Set the new password for your account so you can login and access all the features.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.65),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter Email",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Please enter your email'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter New Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _newPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a new password";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('* * * * * * * * *'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _confirmPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a new password";
                  } else if (value != _newPassword.text) {
                    return "Password do not match";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('* * * * * * * * *'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: getDeviceWidth(context),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1C6BFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      String email = _email.text;
                      String newPassword = _newPassword.text;
                      String confirmPassword = _confirmPassword.text;

                      //Call your API to reset the password
                      resetPassword(email, newPassword, confirmPassword);

                      //Clear the password fields
                      _email.clear();
                      _newPassword.clear();
                      _confirmPassword.clear();
                    }
                  },
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(
      String email, String newPassword, String confirmPassword) async {
    final ApiUrl = Api.appurl;
    final apiUrl = Uri.parse('$ApiUrl/reset-password');
    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'email': email,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    });

    try {
      final response = await http.post(apiUrl, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Password reset successful
        print('Password reset successful');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
        // Navigate to a success screen or perform other actions as needed.
      } else {
        // Password reset failed
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['message'];
        print('Password reset failed: $errorMessage');
        // Handle the error and provide appropriate feedback to the user.
      }
    } catch (error) {
      print('Error resetting password: $error');
      // Handle network errors or other exceptions.
    }
  }
}
