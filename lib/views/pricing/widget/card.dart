import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/views/pay_invoice/widget/loading.dart';
import 'package:murphys_technology/views/pricing/widget/card_number_input_formet.dart';

import 'package:murphys_technology/utils/device_size.dart';

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

  final TextEditingController _CardsController = TextEditingController();

  final TextEditingController _validController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _CardsController.dispose();
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
          Text(
            "Cards number",
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
            controller: _CardsController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your Cards number";
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
            "Cards holder",
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
              hintText: "Your name and surname",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: const Icon(Icons.person_2),
            ),
          ),
          const SizedBox(
            height: 15,
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoadingScreen(),
                    ));
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
          )
        ],
      ),
    );
  }
}
