import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/behaviour/behavour.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pricing/PayingPage.dart';

class PricingDetails extends StatefulWidget {
  const PricingDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<PricingDetails> createState() => _PricingDetailsState();
}

class _PricingDetailsState extends State<PricingDetails>
    with TickerProviderStateMixin {
  List<String> priceList = [
    "\$699",
    "\$899",
    "\$1600",
  ];
  List<String> plans = [
    "Static",
    "Power plan",
    "Ecommerce plan",
  ];
  // List<Map> priceList = [{"name":"\$699"}, {"name":"\$899"}, {"name":"\$1600"},];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 3,
      vsync: this,
    );
    final appbar = AppBar(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black.withOpacity(0.7),
        size: 28,
      ),
      title: Text(
        "Plan & Pricing",
        style: TextStyle(
          fontSize: getDeviceWidth(context) * 0.065 +
              getDeviceHeight(context) * 0.0008,
          fontFamily: "Poppins",
          color: Colors.black54,
        ),
      ),
      // actions: const [
      //   Icon(
      //     CupertinoIcons.bell_circle,
      //     size: 30,
      //   ),
      //   SizedBox(
      //     width: 20,
      //   ),
      // ],
    );
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 224, 236, 248),
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: appbar,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getDeviceWidth(context) * 0.04,
                vertical: getDeviceHeight(context) * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(),
                  ],
                ),
                Center(
                  child: Container(
                    height: getDeviceHeight(context) * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff5496FE),
                      ),
                      controller: tabController,
                      // isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      tabs: [
                        SizedBox(
                          width: getDeviceWidth(context) * 0.15,
                          child: Tab(
                            height: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      priceList[0],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: getDeviceWidth(context) *
                                                0.045 +
                                            getDeviceHeight(context) * 0.0008,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    Text(
                                      "Static",
                                      style: TextStyle(
                                          fontSize: getDeviceWidth(context) *
                                                  0.035 +
                                              getDeviceHeight(context) * 0.0008,
                                          color: Colors.black,
                                          fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Tab(
                            height: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      priceList[1],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: getDeviceWidth(context) *
                                                0.045 +
                                            getDeviceHeight(context) * 0.0008,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    Text(
                                      "CMS",
                                      style: TextStyle(
                                          fontSize: getDeviceWidth(context) *
                                                  0.035 +
                                              getDeviceHeight(context) * 0.0008,
                                          color: Colors.black,
                                          fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Tab(
                            height: 90,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      priceList[2],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: getDeviceWidth(context) *
                                                0.045 +
                                            getDeviceHeight(context) * 0.0008,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    Text(
                                      "Shopify",
                                      style: TextStyle(
                                          fontSize: getDeviceWidth(context) *
                                                  0.035 +
                                              getDeviceHeight(context) * 0.0008,
                                          color: Colors.black,
                                          fontFamily: "Poppins"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.015,
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        height: getDeviceHeight(context) * 0.45,
                        width: getDeviceWidth(context),
                        decoration: BoxDecoration(
                          // color: Colors.black12.withOpacity(0.1),
                          // color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              planList("Value plan"),
                              planList("5-7 pages"),
                              planList("Unlimited revisions"),
                              planList("Static"),
                              planList("Responsive Layout"),
                              planList("5 webmail account"),
                              planList("500MB web space"),
                              planList("Bandthwidth 99.9% uptime guaranteed"),
                              planList("24x7 Email support"),
                              planList("Free domain"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: getDeviceHeight(context) * 0.45,
                        width: getDeviceWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              planList("Power plan"),
                              planList("15+ Dynamic pages"),
                              planList("Unlimited revisions"),
                              planList("CMS"),
                              planList("Responsive Layout"),
                              planList("10 webmail account"),
                              planList("1GB web space"),
                              planList("Bandthwidth 99.9% uptime guaranteed"),
                              planList("24x7 Email support"),
                              planList("Free domain"),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: getDeviceHeight(context) * 0.45,
                        width: getDeviceWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              planList("Ecommerce plan"),
                              planList("Unlimited Dynamic Pages"),
                              planList("Unlimited revisions"),
                              planList("Ecommerce"),
                              planList("Responsive Layout"),
                              planList("15 webmail account"),
                              planList("2GB web space"),
                              planList("Bandthwidth 99.9% uptime guaranteed"),
                              planList("24x7 Email support"),
                              planList("Free domain"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.015,
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: SizedBox(
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
                              Get.to(
                                () => PayingPage(
                                  name: tabController.index == 0
                                      ? plans[0]
                                      : tabController.index == 1
                                          ? plans[1]
                                          : plans[2],
                                  plan: tabController.index == 0
                                      ? priceList[0]
                                      : tabController.index == 1
                                          ? priceList[1]
                                          : priceList[2],
                                ),
                                transition: Transition.leftToRightWithFade,
                              );

                              // Navigator.pushNamed(
                              //     context, RoutesName.payinvoice);
                            },
                            child: Text(
                              "Select Your Plan",
                              style: TextStyle(
                                fontSize: getDeviceWidth(context) * 0.04 +
                                    getDeviceHeight(context) * 0.0008,
                                color: Colors.white,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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

  Widget planList(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 9),
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.arrow_right,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.036 +
                      getDeviceHeight(context) * 0.0008,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins"),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
