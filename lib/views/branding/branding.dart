import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/freeQuote/free_quote.dart';

class BrandingScreen extends StatefulWidget {
  const BrandingScreen({super.key});

  @override
  State<BrandingScreen> createState() => _BrandingScreenState();
}

class _BrandingScreenState extends State<BrandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                              size: 32,
                            ),
                          ),
                          Text(
                            "Business Branding",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.75),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: getDeviceHeight(context) * 0.3,
                    width: getDeviceWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("images/fullbusinessbranding.png")),
                    ),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Full Business Branding",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.75),
                              fontSize: 21,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            height: getDeviceHeight(context) * 0.08,
                            width: 75,
                            decoration: BoxDecoration(
                              color: const Color(0xff7BCEF8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                    ),
                                    Text(
                                      "4.8",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Rating",
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.01,
                      ),
                      SizedBox(
                        height: 140,
                        width: getDeviceWidth(context),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            "Creating a distinct identity for a business in the mind of your target audience and consumers and made up of a company's name and logo, visual design, mission, and tone of voice",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white54.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove_from_queue_sharp,
                                    size: 32,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Total Remarks",
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.star_border),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white54.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Icon(
                                    Icons.delivery_dining,
                                    size: 32,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivery time",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                  Text(
                                    "Depends",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black.withOpacity(0.45),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 65,
                          width: getDeviceWidth(context) * 0.24,
                        ),
                        Container(
                          height: 25,
                          width: getDeviceWidth(context) * 0.24,
                          decoration: const BoxDecoration(
                            color: Color(0xff9680EA),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 90,
                      width: getDeviceWidth(context) * 0.76,
                      decoration: const BoxDecoration(
                        color: Color(0xff9680EA),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Approximate",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Text(
                                  "\$3500",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: getDeviceWidth(context) * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const FreeQuote(),
                                    transition: Transition.zoom);
                              },
                              child: Container(
                                height: 70,
                                width: getDeviceWidth(context) * 0.35,
                                decoration: BoxDecoration(
                                  color: const Color(0xffb6a5fe),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Order Now",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: getDeviceWidth(context) * 0.054,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const FreeQuote(),
                          transition: Transition.zoom);
                    },
                    child: Container(
                      height: 57,
                      width: 65,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 251, 151, 150),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        CupertinoIcons.chat_bubble_2,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 54,
                  left: getDeviceWidth(context) * 0.215,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff9680EA),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
