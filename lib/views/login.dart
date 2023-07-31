import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/views/bottomNavBar/bot.dart';
import 'package:murphys_technology/views/signup.dart';

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
                    Center(
                      child: Container(
                        height: 120,
                        width: 300,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
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
                                borderRadius: BorderRadius.circular(28))),
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
                              offset: Offset(0, 5))
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
                          Get.to(() => const BottomNB(index: 1),
                              transition: Transition.zoom);
                        },
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
          )
        ],
      ),
    );
  }
}
