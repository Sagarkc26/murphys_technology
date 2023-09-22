import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/forgetpassword/password.dart';
import 'package:http/http.dart' as http;

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  void authenticatedOTP() async {
    final ApiUrl = Api.appurl;
    final enteredOTP =
        controllers.map((controller) => controller.text).join('');
    try {
      final response = await http.post(
        Uri.parse('$ApiUrl/authentication-otp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'enteredOTP': enteredOTP}),
      );
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['message'] == 'Authentication successful') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const PasswordScreen(),
          ));
        }
        // Handle authentication success here
      } else {
        // Handle authentication failure here
      }
    } catch (error) {
      print('Error authenticating OTP: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Verification"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 55,
            ),
            const Text(
              "Enter 4 Digits Code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Enter the 4 digits code that you received on your email.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      controller: controllers[index],
                      onChanged: (value) {
                        if (value.length == 1 && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      onSaved: (pin) {},
                      decoration: InputDecoration(
                        hintText: "0",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you don't receive your code",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Resend",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red[300],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: getDeviceWidth(context) * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1C6BFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                onPressed: () {
                  authenticatedOTP();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const PasswordScreen(),
                  //     ));
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // const Text(
            //   "Don't have an account?",
            //   style: TextStyle(
            //     fontSize: 15,
            //     fontFamily: "Poppins",
            //     color: Colors.black54,
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // SizedBox(
            //   height: 50,
            //   width: getDeviceWidth(context) * 0.9,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       side: const BorderSide(width: 1, color: Colors.black54),
            //       backgroundColor: Colors.grey[50],
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //     ),
            //     onPressed: () => Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const SignupScreen(),
            //         )),
            //     child: const Text(
            //       "Sign Up",
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontFamily: "Poppins",
            //         color: Colors.black87,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
