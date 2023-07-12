import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 90,
                          width: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/logo.png"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
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
                              hintText: "Your Fullname",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                          controller: _businessname,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Business name";
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
                      const SizedBox(
                        height: 20,
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
                              hintText: "Your Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                          decoration: InputDecoration(
                            fillColor: Colors.grey[50],
                            filled: true,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(Icons.email),
                            ),
                            hintText: "Phone number",
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
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 10,
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
                          // Column(
                          //                 children: List.generate(
                          //                   checkListItems.length,
                          //                   (index) => CheckboxListTile(
                          //                     title: Text(
                          //                       checkListItems[index]['title'],
                          //                       style: const TextStyle(
                          //                         fontSize: 18,
                          //                         fontFamily: "Poppins",
                          //                         fontWeight: FontWeight.w500,
                          //                       ),
                          //                     ),
                          //                     value: checkListItems[index]
                          //                         ['value'],
                          //                     onChanged: (value) {
                          //                       setState(() {
                          //                         for (var element
                          //                             in checkListItems) {
                          //                           element['value'] = false;
                          //                         }
                          //                         checkListItems[index]
                          //                             ['value'] = value;
                          //                         selected =
                          //                             "${checkListItems[index]['id']},${checkListItems[index]['title']},${checkListItems[index]['value']},";
                          //                       });
                          //                     },
                          //                   ),
                          //                 ),
                          //               ),
                          Text(
                            "Are you our existing Client?",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
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
                            Navigator.pop(context);
                          },
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
}

Widget input(String text) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 11,
            offset: Offset(0, 7),
          )
        ]),
    child: TextFormField(
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
        label: Text(text),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
    ),
  );
}
