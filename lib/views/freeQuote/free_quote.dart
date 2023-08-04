import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:url_launcher/url_launcher.dart';

class FreeQuote extends StatefulWidget {
  const FreeQuote({super.key});

  @override
  State<FreeQuote> createState() => _FreeQuoteState();
}

class _FreeQuoteState extends State<FreeQuote> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff463f97),
        elevation: 0,
        title: Text(
          "FIND OUT HOW WE",
          style: TextStyle(
            fontSize: 23,
            fontFamily: "NotoSerif",
            color: Colors.white.withOpacity(0.85),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                height: getDeviceHeight(context) * 0.215,
                width: getDeviceWidth(context),
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
                        fontSize: 22,
                        fontFamily: "NotoSerif",
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Looking for an Online Marketing Agency ?",
                      style: TextStyle(
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
              SizedBox(
                height: 55,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff463f97),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
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
                  child: const Text(
                    "SUBMIT NOW",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
