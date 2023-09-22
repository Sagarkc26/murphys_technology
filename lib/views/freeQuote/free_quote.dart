import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/views/provider/notification.dart';
import 'package:murphys_technology/views/provider/userdata.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreeQuote extends StatefulWidget {
  const FreeQuote({super.key});

  @override
  State<FreeQuote> createState() => _FreeQuoteState();
}

class _FreeQuoteState extends State<FreeQuote> {
  String? email;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      backgroundColor: const Color(0xff463f97),
      elevation: 0,
      title: Text(
        "FIND OUT HOW WE",
        style: TextStyle(
          fontSize: getDeviceWidth(context) * 0.05 +
              getDeviceHeight(context) * 0.0008,
          fontFamily: "NotoSerif",
          color: Colors.white.withOpacity(0.85),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
    final provider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: appbar,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: getDeviceWidth(context),
                padding: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  color: Color(0xff463f97),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "CAN INCREASE YOUR REVENUE",
                      style: TextStyle(
                        fontSize: getDeviceWidth(context) * 0.05 +
                            getDeviceHeight(context) * 0.0008,
                        fontFamily: "NotoSerif",
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Looking for an Online Marketing Agency ?",
                      style: TextStyle(
                        fontSize: getDeviceWidth(context) * 0.036 +
                            getDeviceHeight(context) * 0.0008,
                        color: Colors.white.withOpacity(0.8),
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "We’re the agency you don’t want working for your",
                      style: TextStyle(
                        fontSize: getDeviceWidth(context) * 0.0335 +
                            getDeviceHeight(context) * 0.0008,
                        color: Colors.white.withOpacity(0.8),
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "competition – so simply fill in the form below",
                      style: TextStyle(
                        fontSize: getDeviceWidth(context) * 0.036 +
                            getDeviceHeight(context) * 0.0008,
                        color: Colors.white.withOpacity(0.8),
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
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
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          controller: _subjectController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Subject";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Subject",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your phone number";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Phone",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          controller: _messageController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "Message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<UserProvider>(
                      builder: (context, value, child) {
                        return SizedBox(
                          height: 55,
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff463f97),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () async {
                              final isValid = _key.currentState!.validate();
                              if (isValid) {
                                await sendEmail();
                                final int id =
                                    provider.notifications.length + 1;
                                await provider.showTopNotification(
                                    provider.flutterLocalNotificationsPlugin,
                                    id);
                              }
                            },
                            // onPressed: () async {
                            //   final isValid = _key.currentState!.validate();
                            //   if (isValid) {
                            //     String name = _nameController.text;
                            //     String email = _emailController.text;
                            //     String subject = _subjectController.text;
                            //     String phone = _phoneController.text;
                            //     String message = _messageController.text;

                            //     // String plan = widget.plan.toString();

                            //     String? encodeQueryParameters(
                            //         Map<String, String> params) {
                            //       return params.entries
                            //           .map((MapEntry<String, String> e) =>
                            //               '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            //           .join('&');
                            //     }

                            //     final Uri emailUri = Uri(
                            //       scheme: "mailto",
                            //       path: "info@murphystechnology.com",
                            //       query: encodeQueryParameters(
                            //         <String, String>{
                            //           "subject": "Credit card",
                            //           "body":
                            //               "Full Name: $name\n Email: $email\n Subject:$subject\n Phone no.: $phone\n Message: $message\n"
                            //         },
                            //       ),
                            //     );
                            //     await launchUrl(emailUri);
                            //   }
                            //   // Navigator.of(context).push(MaterialPageRoute(
                            //   //   builder: (context) => const LoadingScreen(),
                            //   // ));
                            // },
                            child: Text(
                              "SUBMIT NOW",
                              style: TextStyle(
                                fontSize: getDeviceWidth(context) * 0.04 +
                                    getDeviceHeight(context) * 0.0008,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final ApiUrl = Api.appurl;
    final url = Uri.parse('$ApiUrl/send-email');
    final apiKey =
        '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'; // Replace with your API key

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };
    String name = _nameController.text;
    String email = _emailController.text;
    String subject = _subjectController.text;
    String phone = _phoneController.text;
    String message = _messageController.text;

    String? emails = prefs.getString("email");
    String? fullname = prefs.getString("name");

    final emailData = {
      'sender': {'name': fullname, 'email': emails},
      'to': [
        {'email': 'sagarmurphys@gmail.com'}
      ],
      'subject': 'FreeQuote',
      'textContent':
          'FullName : $name\n Email-id : $email\n Subejct : $subject\n Phone no : $phone\n Message : $message',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(emailData),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully');
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _phoneController.clear();
      _messageController.clear();
    } else {
      print('Failed to send email');
      print('Response: ${response.body}');
    }
  }
}
