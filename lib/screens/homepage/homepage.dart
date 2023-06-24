import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:murphys_technology/behaviour/behavour.dart';
import 'package:murphys_technology/utils/device_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> ourServices = [
    {
      "name": "Refer a friend",
      "description":
          "Join the Murphys Tech's affiliate program and earn from every purchase.",
    },
    {
      "name": "SEO",
      "description":
          "Rank on google and get noticed we’re all about making your business visible.",
    },
    {
      "name": "News",
      "description":
          "Get the latest updates, offers, promo code, news from Murphy’s Technology."
    },
    {
      "name": "Free tips/tricks",
      "description":
          "To successfully market to your audience, you need to go digital now!",
    },
  ];

  int _currentPage = 0;

  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat("kk").format(now));
    var message = "";
    IconData icon;
    if (timeNow < 12) {
      message = "Good morning";
      icon = Icons.wb_sunny_outlined;
    } else if ((timeNow >= 12) && (timeNow < 17)) {
      message = "Good Afternoon";
      icon = Icons.sunny;
    } else if ((timeNow >= 17) && (timeNow < 20)) {
      message = "Good evening";
      icon = Icons.nightlight_round;
    } else {
      message = "Good night";
      icon = Icons.nights_stay_outlined;
    }
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xfffffefe),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getDeviceHeight(context) * 0.4,
                width: getDeviceWidth(context),
                decoration: const BoxDecoration(
                  color: Color(0xff463f97),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 22,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            CupertinoIcons.bars,
                            size: 32,
                            color: Colors.white,
                          ),
                          Icon(
                            CupertinoIcons.bell,
                            size: 29,
                            color: Colors.white.withOpacity(0.8),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: Row(
                              children: [
                                Text(
                                  message,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  icon,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 42,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Icon(
                                    Icons.headset_mic_outlined,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "Services",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins"),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 28,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "Drop us a line, ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "coffee’s on us",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              fontFamily: "NotoSerif",
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ready to launch your new website? We’ve put on our creative hats to level up web design, Australia-wide.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.75),
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffFE4C58),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.call,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Call Now",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff4C78FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.details_sharp,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "About Us",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                      // SizedBox(
                      //   height: 20,
                      //   child: ElevatedButton(
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: "tel",
                      //           path: "9860558833",
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url);
                      //         } else {
                      //           print("cannot lunch");
                      //         }
                      //       },
                      //       child: Text("call")),
                      // )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 25,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Features",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/invoice.png"),
                                ),
                                color: Color.fromARGB(255, 249, 238, 242),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Pay Invoice",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/branding.png"),
                                ),
                                color: Color.fromARGB(255, 253, 213, 228),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Branding",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/freeQuote.png"),
                                ),
                                color: Color.fromARGB(255, 253, 213, 228),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              "Free Quote",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.03,
                    ),
                    SizedBox(
                      height: 170,
                      width: getDeviceWidth(context),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: ourServices.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Container(
                              height: 150,
                              width: getDeviceWidth(context),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xff5955A0),
                                    Color(0xffAB9EE4)
                                  ],
                                ),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 165,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage("images/servicepic.png"),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ourServices[index]['name'],
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 100,
                                          width: 170,
                                          child: Text(
                                            ourServices[index]['description'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontFamily: "Poppins",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
