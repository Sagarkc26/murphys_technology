import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/pay_invoice/widget/loading.dart';
import 'package:murphys_technology/views/pricing/widget/card_number_input_formet.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/provider/notification.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class List1 extends StatefulWidget {
  List<String> savedCardNumbers = [];
  String totalprice;
  String invoice;

  List1({
    Key? key,
    required this.totalprice,
    required this.invoice,
  }) : super(key: key);

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  bool isSwitched = false;

  bool showCardDetails = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _popCardController = TextEditingController();

  final TextEditingController _cardController = TextEditingController();

  final TextEditingController _validController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _referralController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCardDetails();
  }

  Future<void> loadCardDetails() async {
    final savedCardDetails = await CardDetailsStorage.getCardDetails();
    if (savedCardDetails != null) {
      _cardController.text = savedCardDetails;
      setState(() {
        isSwitched = true;
      });
    }
  }

  Future<void> savedCardDetails() async {
    final cardNumber = _cardController.text;
    if (isSwitched) {
      await CardDetailsStorage.saveCardDetails(cardNumber);
    } else {
      await CardDetailsStorage.saveCardDetails('');
    }
    setState(() {
      showCardDetails = isSwitched && cardNumber.isNotEmpty;
    });
  }

  void showSavedCardDetailsDialog() {
    _popCardController.text = _cardController.text;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Saved Card Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Card Number:"),
              TextFormField(
                controller: _popCardController,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _cardController.text = _popCardController.text;
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _cardController.dispose();
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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
            SizedBox(
              height: getDeviceHeight(context) * 0.01,
            ),
            GestureDetector(
              onTap: () {
                if (showCardDetails) {
                  showSavedCardDetailsDialog();
                }
              },
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(16),
                ],
                controller: _cardController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your card number";
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
                          image: AssetImage("images/master.png"),
                        ),
                      ),
                    ),
                  ),
                  hintText: "* * * *  * * * *  * * * *  * * * *",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
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
                        keyboardType: TextInputType.number,
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
                        controller: _cvvController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
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
            SizedBox(
              height: getDeviceHeight(context) * 0.01,
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
                  hintText: "Your Fullname",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.person_2)),
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
                    onChanged: (value) => setState(() {
                      isSwitched = value;
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.01,
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
                    savedCardDetails();
                    if (isValid) {
                      bool? emailSent = await _sendEmaill();
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

                      // String price = widget.totalprice;
                      // String invoice = widget.invoice;
                      // String name = _nameController.text;
                      // String number = _cardController.text;
                      // String validDate = _validController.text;
                      // String cvv = _cvvController.text;

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
                      //       "subject": "Credit card",
                      //       "body":
                      //           "Total Price: \$ $price\n Invoice number: # $invoice\n Card holder name:$name\n Card number: $number\n Valid date: $validDate\n CVV: $cvv"
                      //     },
                      //   ),
                      // );
                      // await launchUrl(emailUri);
                    }
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
      ),
    );
  }

  Future<bool> _sendEmaill() async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey =
        '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'; // Replace with your SendinBlue SMTP API Key
    final url = Uri.parse('https://api.sendinblue.com/v3/smtp/email');

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };
    String card = _cardController.text;
    String valid = _validController.text;
    String cvv = _cvvController.text;
    String name = _nameController.text;
    String totalprice = widget.totalprice.toString();
    String invoice = widget.invoice.toString();
    String referral = _referralController.text;
    String? email = prefs.getString("email");
    String? fullname = prefs.getString("name");

    final emailData = {
      'sender': {'name': fullname, 'email': email},
      'to': [
        {'email': 'sagarkc45172@gmail.com'}
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
      _cardController.clear();
      _validController.clear();
      _cvvController.clear();
      _nameController.clear();
      _referralController.clear();
    } else {
      print('Failed to send email');
      print('Response: ${response.body}');
    }
    return true;
  }

  // Future<bool> pcsendEmail() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final ApiUrl = Api.appurl;
  //   final url = Uri.parse('$ApiUrl/send-email');
  //   final apiKey =
  //       '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'; // Replace with your API key

  //   final headers = {
  //     'Content-Type': 'application/json',
  //     'api-key': apiKey,
  //   };
  //   String card = _cardController.text;
  //   String valid = _validController.text;
  //   String cvv = _cvvController.text;
  //   String name = _nameController.text;
  //   String totalprice = widget.totalprice.toString();
  //   String invoice = widget.invoice.toString();
  //   String referral = _referralController.text;
  //   String? email = prefs.getString("email");
  //   String? fullname = prefs.getString("name");

  //   final emailData = {
  //     'sender': {'name': fullname, 'email': email},
  //     'to': [
  //       {'email': 'sagarmurphys@gmail.com'}
  //     ],
  //     'subject': 'Plans',
  //     'textContent':
  //         'Total price : $totalprice\n Invoice number : $invoice\n Card Number : $card\n Valid Unit : $valid\n CVV : $cvv\n Cards holder Name : $name\n Referral Code : $referral',
  //   };

  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode(emailData),
  //   );

  //   if (response.statusCode == 200) {
  //     print('Email sent successfully');
  //     _cardController.clear();
  //     _validController.clear();
  //     _cvvController.clear();
  //     _nameController.clear();
  //     _referralController.clear();

  //     return true;
  //   } else {
  //     print('Failed to send email');
  //     print('Response: ${response.body}');
  //     return false;
  //   }
  // }
}

class CardDetailsStorage {
  static Future<void> saveCardDetails(String cardNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardNumber', cardNumber);
  }

  static Future<String?> getCardDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('cardNumber');
  }
}
