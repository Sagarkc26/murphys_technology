import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pay_invoice/widget/loading.dart';
import 'package:murphys_technology/views/pricing/widget/card_number_input_formet.dart';

class Paypal extends StatefulWidget {
  String plan;
  Paypal({
    super.key,
    required this.plan,
  });

  @override
  State<Paypal> createState() => _PaypalState();
}

class _PaypalState extends State<Paypal> {
  bool isSwitched = false;

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController _paypalController = TextEditingController();

  TextEditingController _validController = TextEditingController();

  TextEditingController _cvvController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
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
            const SizedBox(
              height: 15,
            ),
            Text(
              "Card holder",
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
                  return "Enter Card holder name";
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
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Save card data for future payments",
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
                      // String validDate = _validController.text;
                      // String cvv = _cvvController.text;
                      // String number = _paypalController.text;
                      // String plans = widget.plan.toString();
                      // String? encodeQueryParameters(
                      //     Map<String, String> params) {
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
                      //           "Plans: $plans\n holder name:$name\n PayPal number: $number\n Valid date: $validDate\n CVV: $cvv"
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
                      fontSize: getDeviceWidth(context) * 0.04 +
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
      ),
    );
  }
}
