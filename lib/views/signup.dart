import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/login.dart';

import '../api/apiurl.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = true;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _businessname = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool? isChecke = false;
  List<Map> checkListItems = [
    {
      "id": 0,
      "value": true,
      "title": "Notification on",
    },
    {
      "id": 1,
      "value": false,
      "title": "Notification off",
    },
  ];
  bool isEmailValid(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    // Use a regular expression pattern to match the password criteria
    // At least one number, one alphabet character, and one special character
    final pattern = r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Sign up"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _key,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Center(
                        child: Image.asset("images/logo.png"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 11,
                                  offset: Offset(0, 7))
                            ]),
                        child: TextFormField(
                          controller: _fullname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.grey[50],
                              filled: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Icon(Icons.person_2),
                              ),
                              hintText: "Your Full Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28))),
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.013,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 11,
                                  offset: Offset(0, 7))
                            ]),
                        child: TextFormField(
                          controller: _businessname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Business Name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.grey[50],
                              filled: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Icon(Icons.person_2),
                              ),
                              hintText: "Your Business name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28))),
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.013,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 11,
                                  offset: Offset(0, 7))
                            ]),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Email";
                            } else if (!isEmailValid(value)) {
                              return 'Email must contain @';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.grey[50],
                              filled: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Icon(Icons.email),
                              ),
                              hintText: "Your Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28))),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.013,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Colors.black38,
                          //     blurRadius: 1,
                          //   ),
                          // ],
                        ),
                        child: IntlPhoneField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[50],
                            filled: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(Icons.email),
                            ),
                            hintText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 11,
                              offset: Offset(0, 7),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.grey[50],
                            filled: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(Icons.password),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            hintText: "Create Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.013,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 11,
                                  offset: Offset(0, 7))
                            ]),
                        child: TextFormField(
                          obscureText: passwordVisible,
                          controller: _confirmController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Password";
                            } else if (value.length < 8) {
                              return "Password must have at least 8 characters";
                            } else if (!isPasswordValid(value)) {
                              return 'Password must contain at least one number, one alphabet and one special character';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.grey[50],
                            filled: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(Icons.password),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.013,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: isChecke,
                            onChanged: (value) {
                              setState(() {
                                isChecke = value;
                              });
                            },
                          ),
                          const Text(
                            "Are you our existing Client?",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.013,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1C6BFE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          onPressed: () {
                            final isValid = _key.currentState!.validate();
                            if (isValid) {
                              signupFunc();
                            }
                          },
                          // onPressed: () {
                          //   FirebaseAuth.instance
                          //       .createUserWithEmailAndPassword(
                          //           email: _emailController.text,
                          //           password: _passwordController.text)
                          //       .then((value) {
                          //     print("new Account created");
                          //     Navigator.pop(context);
                          //   }).onError((error, stackTrace) {
                          //     print('Error ${error.toString()}');
                          //   });
                          // },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.blue,
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signupFunc() async {
    try {
      const apiUrl = Api.appurl;
      const appurl = "$apiUrl/signup";
      final name = _fullname.text;
      final businessname = _businessname.text;
      final email = _emailController.text;
      final phoneno = _phoneController.text;
      final password = _passwordController.text;
      final confirmpassword = _confirmController.text;

      final body = {
        "name": name,
        "businessname": businessname,
        "email": email,
        "phoneno": phoneno,
        "password": password,
        "confirmpassword": confirmpassword,
      };
      const url = appurl;
      final uri = Uri.parse(url);
      final response = await http.post(uri, body: jsonEncode(body), headers: {
        "Content-type": "application/json",
      }).timeout(
        const Duration(seconds: 10),
      );
      if (response.statusCode == 201) {
        Utils.flushErrorMessage(
            "Account Created Succefully", context, Colors.green);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      } else if (response.statusCode == 409) {
        Utils.flushErrorMessage("User Already exists", context, Colors.red);
      } else {
        // Handle other response status codes (e.g., show an error message)
        final responseBody = jsonDecode(response.body);
        // Display an error message to the user
        final errorMessage = responseBody['error'] ?? 'An error occurred';
        // Show the error to the user (you can use a SnackBar, Dialog, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } on TimeoutException {
      Utils.flushErrorMessage("Server is not responding", context, Colors.red);
    } catch (error) {
      // Handle different types of errors (timeout, connection issue, etc.)
      print('Error during signup: $error');
      // Display an error message to the user
      Utils.flushErrorMessage(
          "Error occurs during signup", context, Colors.red);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('An error occurred. Please try again later.'),
      //     duration: Duration(seconds: 5),
      //   ),
      // );
    }
  }
  // Future<void> signupFunc() async {
  //   const apiUrl = Api.appurl;
  //   const appurl = "$apiUrl/signup";
  //   final name = _fullname.text;
  //   final businessname = _businessname.text;
  //   final email = _emailController.text;
  //   final phoneno = _phoneController.text;
  //   final password = _passwordController.text;
  //   final confirmpassword = _confirmController.text;

  //   final body = {
  //     "name": name,
  //     "businessname": businessname,
  //     "email": email,
  //     "phoneno": phoneno,
  //     "password": password,
  //     "confirmpassword": confirmpassword,
  //   };
  //   const url = appurl;
  //   final uri = Uri.parse(url);
  //   final response = await http.post(uri, body: jsonEncode(body), headers: {
  //     "Content-type": "application/json",
  //   }).timeout(const Duration(seconds: 10));
  //   final responseBody = jsonDecode(response.body);
  //   if (response.statusCode == 201) {
  //     Navigator.pop(context);
  //   }
  // }
}
