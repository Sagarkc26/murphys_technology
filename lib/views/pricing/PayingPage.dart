// import 'package:flutter/material.dart';
// import 'package:murphys_technology/views/pricing/pricing_page.dart';
// import 'package:murphys_technology/utils/device_size.dart';

// class PricingPage extends StatefulWidget {
//   const PricingPage({super.key});

//   @override
//   State<PricingPage> createState() => _PricingPageState();
// }

// class _PricingPageState extends State<PricingPage> {
//   final List<Map> _pricing = [
//     {
//       "name": "Value Plan",
//       "price": "\$699",
//       "page": "5-7 pages",
//       "revision": "Unlimited revisions",
//       "type": "Static",
//       "Layout": "Responsive Layout",
//       "account": "5 webmail account",
//       "space": "500MB web space",
//       "bandwidth": "Bandthwidth 99.9% uptime guaranteed",
//       "panel": "CPanel",
//       "support": "24x7 Email support",
//       "domain": "Free domain"
//     },
//     {
//       "name": "Power Plan",
//       "price": "\$899",
//       "page": "15+ Dynamic pages",
//       "revision": "Unlimited revisions",
//       "type": "CMS",
//       "Layout": "Responsive Layout",
//       "account": "10 webmail account",
//       "space": "1GB web space",
//       "bandwidth": "Bandthwidth 99.9% uptime guaranteed",
//       "panel": "CPanel",
//       "support": "24x7 Email support",
//       "domain": "Free domain"
//     },
//     {
//       "name": "Ecommerce Plan",
//       "price": "\$1600",
//       "page": "Unlimited Dynamic Pages",
//       "revision": "Unlimited revisions",
//       "type": "Ecommerce",
//       "Layout": "Responsive Layout",
//       "account": "15 webmail account",
//       "space": "2GB web space",
//       "bandwidth": "Bandthwidth 99.9% uptime guaranteed",
//       "panel": "CPanel",
//       "support": "24x7 Email support",
//       "domain": "Free domain"
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1C6BFE),
//         // backgroundColor: const Color(0xffe563ff),
//         title: const Text("Plans and Pricing"),
//         centerTitle: true,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(25),
//             bottomRight: Radius.circular(25),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: getDeviceHeight(context) * 0.01,
//           ),
//           Text(
//             "Choose Your Plan",
//             style: TextStyle(
//               color: Colors.black.withOpacity(0.8),
//               fontSize: 26,
//               fontWeight: FontWeight.w600,
//               fontFamily: "NotoSerif",
//             ),
//           ),
//           SizedBox(
//             height: getDeviceHeight(context) * 0.02,
//           ),
//           SizedBox(
//             height: 500,
//             child: ListView.builder(
//               itemCount: _pricing.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => PricingDetails(),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     color: const Color(0xff1C6BFE).withOpacity(0.5),
//                     // color: const Color(0xffe563ff).withOpacity(0.4),
//                     child: ListTile(
//                       title: Text(
//                         _pricing[index]['name'],
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "NotoSerif"),
//                       ),
//                       subtitle: Text(
//                         _pricing[index]['page'],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       trailing: Text(
//                         _pricing[index]['price'],
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: "NotoSerif",
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//       // body: Padding(
//       //   padding: const EdgeInsets.symmetric(
//       //     horizontal: 12,
//       //     vertical: 10,
//       //   ),
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Text(
//       //         "Choose Your Plan",
//       //         style: TextStyle(
//       //           color: Colors.black.withOpacity(0.8),
//       //           fontSize: 30,
//       //           fontWeight: FontWeight.w600,
//       //           fontFamily: "NotoSerif",
//       //         ),
//       //       ),
//       //       const SizedBox(
//       //         height: 10,
//       //       ),
//       //       SizedBox(
//       //         height: getDeviceHeight(context) * 0.75,
//       //         width: getDeviceWidth(context),
//       //         child: ListView.builder(
//       //           scrollDirection: Axis.vertical,
//       //           itemCount: _pricing.length,
//       //           itemBuilder: (context, index) {
//       //             return Card(
//       //               shape: RoundedRectangleBorder(
//       //                 side: const BorderSide(
//       //                   width: 0.1,
//       //                   color: Colors.red,
//       //                 ),
//       //                 borderRadius: BorderRadius.circular(20),
//       //               ),
//       //               color: Colors.grey[100],
//       //               child: GestureDetector(
//       //                 onTap: () {
//       //                   Navigator.of(context).push(
//       //                     MaterialPageRoute(
//       //                       builder: (context) => PricingDetails(
//       //                         list: _pricing[index],
//       //                       ),
//       //                     ),
//       //                   );
//       //                 },
//       //                 child: Container(
//       //                   height: MediaQuery.of(context).size.height * 0.3,
//       //                   width: MediaQuery.of(context).size.width,
//       //                   decoration: BoxDecoration(
//       //                     borderRadius: BorderRadius.circular(20),
//       //                   ),
//       //                   child: Padding(
//       //                     padding: const EdgeInsets.symmetric(
//       //                       horizontal: 20,
//       //                       vertical: 7,
//       //                     ),
//       //                     child: Column(
//       //                       crossAxisAlignment: CrossAxisAlignment.start,
//       //                       children: [
//       //                         Center(
//       //                           child: Column(
//       //                             crossAxisAlignment: CrossAxisAlignment.center,
//       //                             children: [
//       //                               Text(
//       //                                 _pricing[index]['name'],
//       //                                 style: const TextStyle(
//       //                                   fontSize: 30,
//       //                                   fontWeight: FontWeight.w500,
//       //                                   // color: Colors.black.withOpacity(0.6),
//       //                                   fontFamily: "NotoSerif",
//       //                                 ),
//       //                               ),
//       //                               const SizedBox(
//       //                                 height: 5,
//       //                               ),
//       //                               Text(
//       //                                 _pricing[index]['price'],
//       //                                 style: const TextStyle(
//       //                                   fontSize: 65,
//       //                                   fontWeight: FontWeight.bold,
//       //                                   fontFamily: "NotoSerif",
//       //                                 ),
//       //                               ),
//       //                               const SizedBox(
//       //                                 height: 5,
//       //                               ),
//       //                             ],
//       //                           ),
//       //                         ),
//       //                         Text(
//       //                           _pricing[index]['page'],
//       //                           style: const TextStyle(
//       //                             fontSize: 20,
//       //                             fontWeight: FontWeight.w400,
//       //                             fontFamily: "NotoSerif",
//       //                           ),
//       //                         ),
//       //                         Text(
//       //                           _pricing[index]['revision'],
//       //                           style: const TextStyle(
//       //                             fontSize: 20,
//       //                             fontWeight: FontWeight.w400,
//       //                             fontFamily: "NotoSerif",
//       //                           ),
//       //                         ),
//       //                         Text(
//       //                           _pricing[index]['Layout'],
//       //                           style: const TextStyle(
//       //                             fontSize: 20,
//       //                             fontWeight: FontWeight.w400,
//       //                             fontFamily: "NotoSerif",
//       //                           ),
//       //                         ),
//       //                       ],
//       //                     ),
//       //                   ),
//       //                 ),
//       //               ),
//       //             );
//       //           },
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pay_invoice/widget/list3.dart';
import 'package:murphys_technology/views/pricing/widget/card.dart';
import 'package:murphys_technology/views/pricing/widget/paypal.dart';

class PayingPage extends StatefulWidget {
  String? plan;
  String? name;
  PayingPage({
    Key? key,
    this.plan,
    this.name,
  }) : super(key: key);

  @override
  State<PayingPage> createState() => _PayingPageState();
}

class _PayingPageState extends State<PayingPage> {
  List<String> items = [
    "Card",
    "PayPal",
    "Bank",
  ];
  List<IconData> icon = [
    CupertinoIcons.check_mark_circled,
    CupertinoIcons.check_mark_circled,
    CupertinoIcons.check_mark_circled,
  ];
  List<dynamic> data = [
    Cards(plan: "\$699"),
    Paypal(plan: "\$699"),
    const List3(),
  ];
  int currentIndex = 0;
  bool isSwitched = false;
  final TextEditingController _totalprice = TextEditingController();
  final TextEditingController _invoicenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: const Color.fromARGB(255, 202, 222, 242),
        elevation: 0,
        title: const Text(
          "Pay Invoice",
          style: TextStyle(
            fontFamily: "poppins",
            fontSize: 25,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total price : ",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.plan.toString(),
                        style: const TextStyle(
                          fontSize: 38,
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.name.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Poppins",
                          color: Colors.black.withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              const Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: getDeviceHeight(context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: getDeviceWidth(context) * 0.277,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: currentIndex == index
                                            ? const Color(0xff1C6BFE)
                                            : const Color.fromARGB(
                                                255, 132, 197, 250),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              items[index],
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                color: currentIndex == index
                                                    ? Colors.white
                                                    : Colors.black
                                                        .withOpacity(0.4),
                                              ),
                                            ),
                                            Icon(
                                              icon[currentIndex],
                                              size: 27,
                                              color: currentIndex == index
                                                  ? Colors.white
                                                      .withOpacity(0.9)
                                                  : Colors.black
                                                      .withOpacity(0.4),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Visibility(
                                  //   visible: currentIndex == index,
                                  //   child: Container(
                                  //     width: 5,
                                  //     height: 5,
                                  //     decoration: const BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Colors.deepPurpleAccent,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      //Main Body
                      Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: getDeviceWidth(context),
                              height: getDeviceHeight(context) * 0.5,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    currentIndex == 0
                                        ? Cards(plan: widget.plan.toString())
                                        : currentIndex == 1
                                            ? Paypal(
                                                plan: widget.plan.toString())
                                            : const List3()
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // currentIndex == 0 || currentIndex == 1
                          //     ? Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           const Text(
                          //             "Save card data for future payments",
                          //             style: TextStyle(
                          //               fontSize: 14,
                          //               fontFamily: "Poppins",
                          //             ),
                          //           ),
                          //           Transform.scale(
                          //             scale: 0.8,
                          //             child: CupertinoSwitch(
                          //               activeColor: const Color.fromARGB(
                          //                   255, 99, 183, 253),
                          //               thumbColor: const Color(0xff1C6BFE),
                          //               trackColor: Colors.blueGrey.shade300,
                          //               // activeColor: const Color(0xff1C6BFE),
                          //               // activeTrackColor: Colors.blue,
                          //               // inactiveThumbColor: Colors.blueGrey,
                          //               // inactiveTrackColor: Colors.blueGrey.shade600,
                          //               // splashRadius: 50,
                          //               value: isSwitched,
                          //               onChanged: (value) =>
                          //                   setState(() => isSwitched = value),
                          //             ),
                          //           ),
                          //         ],
                          //       )
                          //     : Container(),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // currentIndex == 0 || currentIndex == 1
                          //     ? SizedBox(
                          //         height: 50,
                          //         width: getDeviceWidth(context) * 0.8,
                          //         child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             backgroundColor: const Color(0xff1C6BFE),
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.circular(20),
                          //             ),
                          //           ),
                          //           onPressed: () {
                          //             Navigator.of(context)
                          //                 .push(MaterialPageRoute(
                          //               builder: (context) =>
                          //                   const LoadingScreen(),
                          //             ));
                          //           },
                          //           child: const Text(
                          //             "Proceed to confirm",
                          //             style: TextStyle(
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.w500,
                          //               fontFamily: "Poppins",
                          //             ),
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                    ],
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
