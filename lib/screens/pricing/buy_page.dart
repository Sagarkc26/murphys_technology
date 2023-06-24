import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

List<String> paymentMethod = ["Khalti", "E-sewa"];
String currentOption = paymentMethod[0];

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Payment method",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Poppins",
                  ),
                ),
                Container(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.ac_unit_outlined),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    "   Paypal   ",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins"),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Radio(
                    value: paymentMethod[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.ac_unit_outlined),
                  const SizedBox(
                    width: 1,
                  ),
                  const Text(
                    "Credit Card",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins"),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Radio(
                    value: paymentMethod[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: getDeviceWidth(context) * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1C6BFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CardPage(),
                    ),
                  );
                },
                child: const Text(
                  "Buy now",
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: "Poppins"),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
