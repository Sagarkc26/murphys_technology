import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/forgetpassword/verification.dart';
import 'package:murphys_technology/views/signup.dart';
import 'package:http/http.dart' as http;

class InputEmail extends StatefulWidget {
  const InputEmail({super.key});

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Forget Password"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
      ),
      body: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Enter your email for verification process we will send 4 digits code to your email.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "poppins",
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Email",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 8,
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Enter your Email"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: const Text(
                    "Back to Log In",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: getDeviceWidth(context) * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1C6BFE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  onPressed: () async {
                    await sendopt(_emailController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerificationScreen(),
                        ));
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                height: 50,
                width: getDeviceWidth(context) * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 1, color: Colors.black54),
                    backgroundColor: Colors.grey[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      )),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendopt(email) async {
    final ApiUrl = Api.appurl;
    final url = Uri.parse('$ApiUrl/send-otp');
    final apiKey =
        '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'; // Replace with your API key

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };

    final emailData = {
      'sender': {'name': 'Sagar k.c.', 'email': email},
      'to': [
        {'email': 'sagarkc45172@gmail.com'}
      ],
      'subject': 'OTP code',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(emailData),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully');
    } else {
      print('Failed to send email');
      print('Response: ${response.body}');
    }
  }
}
