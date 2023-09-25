import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:murphys_technology/utils/device_size.dart';

class CreditCard extends StatefulWidget {
  String? plan;
  CreditCard({
    Key? key,
    required this.plan,
  }) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _cardNumber = TextEditingController();
  TextEditingController _validDate = TextEditingController();
  TextEditingController _cvv = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _name.dispose();
    _cardNumber.dispose();
    _validDate.dispose();
    _cvv.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        title: const Text("Credit Card"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Card holder",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Your FullName",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Card number",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _cardNumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Card number";
                      } else if (value.length <= 8) {
                        return "Enter complete number";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // prefixIcon: Container(
                      //   height: 50,
                      //   width: 100,
                      //   decoration: const BoxDecoration(
                      //     image: DecorationImage(
                      //       image: NetworkImage(
                      //           "https://www.maya.ph/hubfs/Maya/Pay%20using%20Maya%20Card/Frame%2019382%20(2).png"),
                      //     ),
                      //   ),
                      // ),
                      hintText: "* * * *  * * * *  * * * *  * * * *",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Valid until",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _validDate,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your Valid number";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Month/Year"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "CVV",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _cvv,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your CVV";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "* * * *"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              Column(
                children: [
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
                            String name = _name.text;
                            String number = _cardNumber.text;
                            String validDate = _validDate.text;
                            String cvv = _cvv.text;
                            String plan = widget.plan.toString();

                            String? encodeQueryParameters(
                                Map<String, String> params) {
                              return params.entries
                                  .map((MapEntry<String, String> e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                  .join('&');
                            }

                            final Uri emailUri = Uri(
                              scheme: "mailto",
                              path: "siddhumurphys@gmail.com",
                              query: encodeQueryParameters(
                                <String, String>{
                                  "subject": "Credit card",
                                  "body":
                                      "Plans: $plan\n holder name:$name\n Card number: $number\n Valid date: $validDate\n CVV: $cvv"
                                },
                              ),
                            );
                            await launchUrl(emailUri);
                          }
                          // if (await canLaunchUrl(emailUri)) {
                          //   launchUrl(emailUri);
                          // } else {
                          //   throw Exception("coundnot lauch");
                          // }
                        },
                        child: const Text(
                          "Proceed to confirm",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins,"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
