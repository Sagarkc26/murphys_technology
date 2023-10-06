import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/forgetpassword/verification.dart';
import 'package:murphys_technology/views/signup.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Forget Password"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
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
                    bool emailSent = await sendotp(_emailController.text);
                    if (emailSent) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VerificationScreen(),
                        ),
                      );
                    } else {
                      Utils.flushErrorMessage(
                          "Try Again", context, Colors.brown);
                    }

                    // await sendotp(_emailController.text);
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

//xsmtpsib-7b273196f48e442b484d63f6c8af39b8933afcc1aa8b96b587b6fe1110e1c770-734EZGH9YSMINBnx

  Future<bool> _sendOPT() async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey =
        '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'; // Replace with your SendinBlue SMTP API Key
    final url = Uri.parse('https://api.sendinblue.com/v3/smtp/email');

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };

    String? email = prefs.getString("email");
    String otp = generateOTP();
    final emailData = {
      'sender': {'name': "Murphys Technology", 'email': email},
      'to': [
        {'email': 'sagarmurphys@gmail.com'}
      ],
      'subject': 'OTP code',
      'htmlContent': 'Your OTP is $otp',
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
    return true;
  }

  Future<bool> sendotp(email) async {
    final ApiUrl = Api.appurl;
    final url = Uri.parse('$ApiUrl/send-otp');
    final apiKey =
        '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'; // Replace with your API key

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };

    final emailData = {
      'sender': {
        'name': 'Murphys Technology',
        'email': "info@murphystechnology.com"
      },
      'to': [
        {'email': email}
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
    return true;
  }

  String generateOTP() {
    final random = Random();
    final otp =
        random.nextInt(10000); // Generate a random integer between 0 and 9999
    return otp.toString().padLeft(
        4, '0'); // Ensure it has exactly 4 digits, padding with '0' if needed
  }
}
