import 'package:flutter/material.dart';
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

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 224, 236, 248),
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 222, 242),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black.withOpacity(0.7),
          size: 28,
        ),
        title: const Text(
          "Plan & Pricing",
          style: TextStyle(
            fontSize: 29,
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
      ),
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
                SizedBox(
                  height: getDeviceHeight(context) * 0.015,
                ),
                Center(
                  child: Container(
                    height: 90,
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
                                      priceList[0],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    const Text(
                                      "Static",
                                      style: TextStyle(
                                          fontSize: 15,
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
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    const Text(
                                      "CMS",
                                      style: TextStyle(
                                          fontSize: 15,
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
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                    const Text(
                                      "Shopify",
                                      style: TextStyle(
                                          fontSize: 15,
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
                              planList("Static"),
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PayingPage(
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
                                ),
                              );

                              // Navigator.pushNamed(
                              //     context, RoutesName.payinvoice);
                            },
                            child: const Text(
                              "Select Your Plan",
                              style: TextStyle(
                                fontSize: 18,
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
              style: const TextStyle(
                  fontSize: 16,
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
