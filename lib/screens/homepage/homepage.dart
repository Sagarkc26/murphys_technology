import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:murphys_technology/behaviour/behavour.dart';
import 'package:murphys_technology/screens/homepage/widget/drawer.dart';
import 'package:murphys_technology/screens/homepage/widget/features.dart';
import 'package:murphys_technology/screens/homepage/widget/greeting.dart';
import 'package:murphys_technology/screens/homepage/widget/list.dart';
import 'package:murphys_technology/screens/homepage/widget/pageviewlist.dart';
import 'package:murphys_technology/screens/homepage/widget/sms.dart';
import 'package:murphys_technology/screens/homepage/widget/title.dart';
import 'package:murphys_technology/screens/login.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Uri dialnumber = Uri(scheme: 'tel', path: '9861099262');
  callnumber() async {
    await launchUrl(dialnumber);
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
      appBar: AppBar(
        backgroundColor: const Color(0xff463f97),
        elevation: 0,
        actions: const [
          Icon(
            CupertinoIcons.bell,
            size: 32,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: SizedBox(
        width: getDeviceWidth(context),
        child: const Drawer(
          child: Page(),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getDeviceHeight(context) * 0.35,
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
                      Greeting(message: message, icon: icon),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.03,
                      ),
                      const Titles(),
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
                              onPressed: callnumber,
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
                          const SMS()
                        ],
                      ),
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
                    const Features(),
                    SizedBox(
                      height: getDeviceHeight(context) * 0.03,
                    ),
                    PageViewlist(
                        pageController: _pageController,
                        ourServices: ourServices),
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

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getDeviceWidth(context),
      child: Drawer(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff2B2A7C),
                  Color(0xffC58FC4),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Murphys technology",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                    Text(
                                      "Ekantakuna",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: NetworkImage(
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/678px-Elon_Musk_Royal_Society_%28crop2%29.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getDeviceHeight(context) * 0.05,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: list("Home", CupertinoIcons.home)),
                        list("Profile", Icons.person),
                        list("About us", Icons.album_outlined),
                        list("Plans", Icons.attach_money_outlined),
                        list("Contact us", Icons.contact_page),
                        SizedBox(
                          height: getDeviceHeight(context) * 0.05,
                        ),
                        Container(
                          height: 180,
                          width: getDeviceWidth(context),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Do you want to logout?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
