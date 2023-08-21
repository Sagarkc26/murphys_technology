import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/bottomNavBar/bot.dart';
import 'package:murphys_technology/views/provider/userdata.dart';
import 'package:murphys_technology/views/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apiurl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // @override
  // void initState() {
  //   Timer timer = Timer(
  //     const Duration(seconds: 2),
  //     () {
  //       Navigator.of(context, rootNavigator: true).pop();
  //     },
  //   );
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const AlertDialog(
  //           title: Text("title"),
  //           content: Text("hello every one"),
  //         );
  //       },
  //     ).then((value) {
  //       timer.cancel();
  //     });
  //   });
  // }
  static const NameKey = 'namekey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Log in"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: _key,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset("images/logo.png"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    // const Text(
                    //   "Welcome",
                    //   style: TextStyle(fontSize: 36),
                    // ),
                    // const Text(
                    //   "We are waiting for you",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
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
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Email";
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
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                            child: Icon(Icons.key),
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
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                            loginFunc();
                          }
                        },
                        // onPressed: () {
                        //   FirebaseAuth.instance
                        //       .signInWithEmailAndPassword(
                        //           email: _emailController.text,
                        //           password: _passwordController.text)
                        //       .then((value) {
                        //     Get.to(() => const BottomNB(index: 1),
                        //         transition: Transition.zoom);
                        //   }).onError((error, stackTrace) {
                        //     print('Error ${error.toString()}');
                        //   });
                        // },
                        child: const Text(
                          "Log in",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forget password?",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
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
                        "Don't have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignupScreen(),
                              transition: Transition.leftToRightWithFade);
                        },
                        child: const Text(
                          "Create one",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.blue,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loginFunc() async {
    try {
      const apiUrl = Api.appurl;
      const appurl = "$apiUrl/login";

      final email = _emailController.text;
      final password = _passwordController.text;

      final body = {
        "email": email,
        "password": password,
      };
      const url = appurl;
      final uri = Uri.parse(url);
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {"Content-type": "application/json"},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final accessToken = responseBody['token'];
        final referralCode = responseBody['user']['referralCode'];
        final name = responseBody['user']['name'];
        final businessName = responseBody['user']['businessname'];
        final id = responseBody['user']['_id'];
        print("The response is : ${responseBody}");

        // Store login details in shared preferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("accessToken", accessToken ?? "");
        prefs.setString("name", name ?? "");
        prefs.setString("businessName", businessName ?? "");
        prefs.setString("referralCode", referralCode ?? "");
        prefs.setString('id', id);

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUserData(
            accessToken, name, businessName, referralCode, id);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNB(index: 1),
          ),
        );
      } else if (response.statusCode == 404) {
        Utils.flushErrorMessage("User not found", context, Colors.red);
      } else if (response.statusCode == 401) {
        Utils.flushErrorMessage("Incorrect password", context, Colors.red);
      } else {
        Utils.flushErrorMessage("Login Failed", context, Colors.red);
        print('Login failed');
      }
      if (response.statusCode == 409) {
        Utils.flushErrorMessage(
            "Please Enter your Email and Password", context, Colors.green);
        print("email password is required");
      }
    } on TimeoutException {
      Utils.flushErrorMessage("Server is not responding", context, Colors.red);
    } catch (e) {
      Utils.flushErrorMessage("Error occurs during login", context, Colors.red);
      print('Error during login: $e');
    }
  }

  // Future<void> loginFunc() async {
  //   const apiUrl = Api.appurl;
  //   const appurl = "$apiUrl/login";

  //   final email = _emailController.text;
  //   final password = _passwordController.text;

  //   final body = {
  //     "email": email,
  //     "password": password,
  //   };
  //   const url = appurl;
  //   final uri = Uri.parse(url);
  //   final response = await http.post(
  //     uri,
  //     body: jsonEncode(body),
  //     headers: {"Content-type": "application/json"},
  //   );

  //   if (response.statusCode == 200) {
  //     final responseBody = jsonDecode(response.body);
  //     final accessToken = responseBody['token'];
  //     final referralCode = responseBody['user']['referralCode'];
  //     final name = responseBody['user']['name'];
  //     final businessName = responseBody['user']['businessname'];
  //     print("The response is : ${responseBody}");

  //     final userProvider = Provider.of<UserProvider>(context, listen: false);
  //     userProvider.setUserData(accessToken, name, businessName, referralCode);

  //     // prefs.setString("accessToken", accessToken ?? "");
  //     // prefs.setString("name", name ?? "");
  //     // prefs.setString("businessname", businessName ?? "");
  //     // final userModel = Provider.of<UserDataProvider>(context, listen: false);
  //     // userModel.setEmail(email);
  //     // final responseBody = jsonDecode(response.body);
  //     // final name = responseBody['name'];
  //     // final businessname = responseBody['businessname'];

  //     // final prefs = await SharedPreferences.getInstance();
  //     // prefs.setString("fullName", name.toString());
  //     // prefs.setString("businessName", businessname.toString());
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => BottomNB(index: 1),
  //       ),
  //     );
  //   } else {
  //     print('Login failed');
  //   }
  //   if (response.statusCode == 409) {
  //     print("email password is required");
  //   }
  // }
}
