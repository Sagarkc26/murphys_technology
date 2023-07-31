import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:murphys_technology/behaviour/behavour.dart';
import 'package:murphys_technology/routes/routesName.dart';
import 'package:murphys_technology/views/aboutus/about_us.dart';
import 'package:murphys_technology/views/homepage/widget/features.dart';
import 'package:murphys_technology/views/homepage/widget/greeting.dart';
import 'package:murphys_technology/views/homepage/widget/list.dart';
import 'package:murphys_technology/views/homepage/widget/pageviewlist.dart';
import 'package:murphys_technology/views/homepage/widget/sms.dart';
import 'package:murphys_technology/views/homepage/widget/title.dart';
import 'package:murphys_technology/views/login.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pricing/pricing_page.dart';
import 'package:murphys_technology/views/profile/profile.dart';
import 'package:murphys_technology/views/support/support.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  final List names = [];
  HomePage({super.key});

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
  late VideoPlayerController _controller;
  @override
  void initState() {
    Timer timer = Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color(0xff1C6BFE),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              contentPadding: const EdgeInsets.only(top: 10.0),
              content: Stack(
                children: [
                  SizedBox(
                    width: 320,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 320,
                                decoration: const BoxDecoration(
                                  color: Color(0xff1C6BFE),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                              ),
                              Container(
                                height: 220,
                                width: 320,
                                decoration: const BoxDecoration(
                                  color: Color(0xfffffefe),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const Text(
                                      "Welcome to Murphy's World",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "\"Because we value our customers we are ",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Text(
                                      "indebted for the trust and bond that we create",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Text(
                                      "together to work together for one soul sense",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const Text(
                                      " of purpose, the purpose to serve.\"",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 42,
                                      width: 280,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff1C6BFE),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            "Ok, got it",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
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
                  Positioned(
                    left: 45,
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 230,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFefe),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 30,
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 260,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 5,
                            ),
                          ],
                          color: const Color(0xffFFFefe),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    left: 15,
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 283,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 5,
                            ),
                          ],
                          color: const Color(0xffFFFefe),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.alarm,
                              color: Color(0xff01c8b5),
                              size: 35,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Hope you will enjoy the App",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.6),
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                const Text(
                                  "Let's 10X your business",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).then((value) {
        timer.cancel();
      });
    });
    _controller = VideoPlayerController.asset("images/video.mp4")
      ..initialize().then((value) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Uri dialnumber = Uri(scheme: 'tel', path: '02 7254 4827');
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
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RoutesName.notification),
            child: const Icon(
              CupertinoIcons.bell,
              size: 32,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      drawer: SizedBox(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: getDeviceHeight(context) * 0.03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: list("Home", CupertinoIcons.home),
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.to(() => const ProfileScreen(),
                                    transition: Transition.zoom);
                              },
                              child: list("Profile", Icons.person)),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AboutUs(),
                                  transition: Transition.zoom);
                            },
                            child: list("About us", Icons.details),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const PricingDetails(),
                                  transition: Transition.zoom);
                            },
                            child: list("Plans", Icons.attach_money_outlined),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SupportScreen(),
                                  transition: Transition.zoom);
                            },
                            child: list("Contact us", Icons.contact_mail),
                          ),
                          SizedBox(
                            height: getDeviceHeight(context) * 0.08,
                          ),
                          SizedBox(
                            height: getDeviceHeight(context) * 0.26,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: _controller.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    )
                                  : Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                "V 1.0.0",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
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
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                      top: 10,
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
      ),
    );
  }
}
