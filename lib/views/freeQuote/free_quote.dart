import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class FreeQuote extends StatefulWidget {
  const FreeQuote({super.key});

  @override
  State<FreeQuote> createState() => _FreeQuoteState();
}

class _FreeQuoteState extends State<FreeQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: getDeviceHeight(context) * 0.28,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "FIND OUT HOW WE CAN",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "NotoSerif",
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "INCREASE YOUR REVENUE",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "NotoSerif",
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Text(
                    //   "Looking for an Online Marketing Agency",
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(0.8),
                    //     fontFamily: "Poppins",
                    //   ),
                    // ),
                    // Text(
                    //   "We’re the agency you don’t want working for your",
                    //   style: TextStyle(
                    //     color: Colors.white.withOpacity(0.8),
                    //     fontFamily: "Poppins",
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
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
                    decoration: InputDecoration(
                      hintText: "Email",
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
                    decoration: InputDecoration(
                      hintText: "Phone",
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
                    maxLines: 6,
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
