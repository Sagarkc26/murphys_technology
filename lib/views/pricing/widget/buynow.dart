import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:provider/provider.dart';

class BuyNow extends StatefulWidget {
  String? map;
  BuyNow({
    Key? key,
    this.map,
  }) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> with TickerProviderStateMixin {
  List<String> items = [
    "PayPal",
    "Card",
    "Credit Card",
  ];
  int currentIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    print("object1");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 233, 248),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 214, 233, 248),
        title: const Text(
          "Payment data",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Total price",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.map.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 80, 170, 245),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   width: getDeviceWidth(context),
              //   height: 100,
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 60,
              //         width: getDeviceWidth(context),
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           itemCount: items.length,
              //           itemBuilder: (context, index) => GestureDetector(
              //             onTap: () {
              //               setState(() {
              //                 currentIndex = index;
              //               });
              //             },
              //             child: AnimatedContainer(
              //               duration: const Duration(milliseconds: 300),
              //               margin: const EdgeInsets.all(5),
              //               width: getDeviceWidth(context) * 0.28,
              //               height: 70,
              //               decoration: BoxDecoration(
              //                 color: currentIndex == index
              //                     ? const Color(0xff5770F9)
              //                     : const Color.fromARGB(255, 200, 206, 249),
              //                 borderRadius: currentIndex == index
              //                     ? BorderRadius.circular(20)
              //                     : BorderRadius.circular(10),
              //               ),
              //               child: Center(
              //                 child: Text(
              //                   items[index],
              //                   style: TextStyle(
              //                       color: currentIndex == index
              //                           ? Colors.white
              //                           : Colors.black,
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w500,
              //                       fontFamily: "Poppins"),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TabBar(
                          controller: tabController,
                          indicator: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: "PayPal",
                            ),
                            Tab(
                              text: "Card",
                            ),
                            Tab(
                              text: "Wallet",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 400,
                        // height: getDeviceHeight(context) * 0.6,
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            const Center(
                              child: Text("Paypal"),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Card number",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      prefixIcon: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("images/pic3.png"),
                                          ),
                                        ),
                                      ),
                                      hintText:
                                          "* * * *  * * * *  * * * *  * * * *",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Valid until",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: _controller2,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "Month/Year"),
                                  ),
                                  const Text(
                                    "CVV",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: _controller3,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "* * * *"),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Card holder",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: _controller1,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      hintText: "Your name and surname",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const Center(
                              child: Text("Credit Card"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.02,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: getDeviceWidth(context) * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Proceed to confirm",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins,"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
