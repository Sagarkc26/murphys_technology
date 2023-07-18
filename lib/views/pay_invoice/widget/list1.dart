import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/views/pricing/widget/card_number_input_formet.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:murphys_technology/utils/device_size.dart';

class List1 extends StatefulWidget {
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

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _cardController = TextEditingController();

  final TextEditingController _validController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

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
          SizedBox(
            height: getDeviceHeight(context) * 0.01,
          ),
          TextFormField(
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
                  if (isValid) {
                    String price = widget.totalprice;
                    String invoice = widget.invoice;
                    String name = _nameController.text;
                    String number = _cardController.text;
                    String validDate = _validController.text;
                    String cvv = _cvvController.text;

                    // String plan = widget.plan.toString();

                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    final Uri emailUri = Uri(
                      scheme: "mailto",
                      path: "info@murphystechnology.com",
                      query: encodeQueryParameters(
                        <String, String>{
                          "subject": "Credit card",
                          "body":
                              "Total Price: \$ $price\n Invoice number: # $invoice\n Card holder name:$name\n Card number: $number\n Valid date: $validDate\n CVV: $cvv"
                        },
                      ),
                    );
                    await launchUrl(emailUri);
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
}
