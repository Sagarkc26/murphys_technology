import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/support/support.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color(0xff463f97),
        elevation: 0,
        title: const Text(
          "ABOUT",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "NotoSerif",
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                height: 130,
                width: getDeviceWidth(context),
                decoration: const BoxDecoration(
                  color: Color(0xff463f97),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: const [
                    Text(
                      "MURPHYS TECHNOLOGY",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "NotoSerif",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "We are consumed by a burning desire to",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "develop, refine, and perfect ourselves.",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
              height: 200,
              width: getDeviceWidth(context),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("images/referimage.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              "Our passion has been developing unique, highly functional, visually appealing websites and associated marketing materials for over six years. We are proud of our reputation as a seasoned, innovative web design firm in Sydney, with a track record of successfully establishing and maintaining long-term partnerships with each of our customers. Our experienced, devoted, and talented personnel will provide you with personalized, timely, and attentive customer service, as well as a unique and welcoming blend of professionalism and friendliness.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 55,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4356ea),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              onPressed: () {
                Get.to(() => const SupportScreen(),
                    transition: Transition.rightToLeft);
              },
              child: const Text(
                "ROCK & ROLL",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
