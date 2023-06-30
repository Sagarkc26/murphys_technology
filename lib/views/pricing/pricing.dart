import 'package:flutter/material.dart';
import 'package:murphys_technology/views/pricing/pricing_page.dart';
import 'package:murphys_technology/utils/device_size.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  final List<Map> _pricing = [
    {
      "name": "Value Plan",
      "price": "\$699",
      "page": "5-7 pages",
      "revision": "Unlimited revisions",
      "type": "Static",
      "Layout": "Responsive Layout",
      "account": "5 webmail account",
      "space": "500MB web space",
      "bandwidth": "Bandthwidth 99.9% uptime guaranteed",
      "panel": "CPanel",
      "support": "24x7 Email support",
      "domain": "Free domain"
    },
    {
      "name": "Power Plan",
      "price": "\$899",
      "page": "15+ Dynamic pages",
      "revision": "Unlimited revisions",
      "type": "CMS",
      "Layout": "Responsive Layout",
      "account": "10 webmail account",
      "space": "1GB web space",
      "bandwidth": "Bandthwidth 99.9% uptime guaranteed",
      "panel": "CPanel",
      "support": "24x7 Email support",
      "domain": "Free domain"
    },
    {
      "name": "Ecommerce Plan",
      "price": "\$1600",
      "page": "Unlimited Dynamic Pages",
      "revision": "Unlimited revisions",
      "type": "Ecommerce",
      "Layout": "Responsive Layout",
      "account": "15 webmail account",
      "space": "2GB web space",
      "bandwidth": "Bandthwidth 99.9% uptime guaranteed",
      "panel": "CPanel",
      "support": "24x7 Email support",
      "domain": "Free domain"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: const Color(0xff1C6BFE),
        // backgroundColor: const Color(0xffe563ff),
        title: const Text("Plans and Pricing"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getDeviceHeight(context) * 0.01,
          ),
          Text(
            "Choose Your Plan",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 26,
              fontWeight: FontWeight.w600,
              fontFamily: "NotoSerif",
            ),
          ),
          SizedBox(
            height: getDeviceHeight(context) * 0.02,
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: _pricing.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PricingDetails(),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: const Color(0xff1C6BFE).withOpacity(0.5),
                    // color: const Color(0xffe563ff).withOpacity(0.4),
                    child: ListTile(
                      title: Text(
                        _pricing[index]['name'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "NotoSerif"),
                      ),
                      subtitle: Text(
                        _pricing[index]['page'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        _pricing[index]['price'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: "NotoSerif",
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 12,
      //     vertical: 10,
      //   ),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Choose Your Plan",
      //         style: TextStyle(
      //           color: Colors.black.withOpacity(0.8),
      //           fontSize: 30,
      //           fontWeight: FontWeight.w600,
      //           fontFamily: "NotoSerif",
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       SizedBox(
      //         height: getDeviceHeight(context) * 0.75,
      //         width: getDeviceWidth(context),
      //         child: ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: _pricing.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               shape: RoundedRectangleBorder(
      //                 side: const BorderSide(
      //                   width: 0.1,
      //                   color: Colors.red,
      //                 ),
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               color: Colors.grey[100],
      //               child: GestureDetector(
      //                 onTap: () {
      //                   Navigator.of(context).push(
      //                     MaterialPageRoute(
      //                       builder: (context) => PricingDetails(
      //                         list: _pricing[index],
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: Container(
      //                   height: MediaQuery.of(context).size.height * 0.3,
      //                   width: MediaQuery.of(context).size.width,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                       horizontal: 20,
      //                       vertical: 7,
      //                     ),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Center(
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 _pricing[index]['name'],
      //                                 style: const TextStyle(
      //                                   fontSize: 30,
      //                                   fontWeight: FontWeight.w500,
      //                                   // color: Colors.black.withOpacity(0.6),
      //                                   fontFamily: "NotoSerif",
      //                                 ),
      //                               ),
      //                               const SizedBox(
      //                                 height: 5,
      //                               ),
      //                               Text(
      //                                 _pricing[index]['price'],
      //                                 style: const TextStyle(
      //                                   fontSize: 65,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontFamily: "NotoSerif",
      //                                 ),
      //                               ),
      //                               const SizedBox(
      //                                 height: 5,
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Text(
      //                           _pricing[index]['page'],
      //                           style: const TextStyle(
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.w400,
      //                             fontFamily: "NotoSerif",
      //                           ),
      //                         ),
      //                         Text(
      //                           _pricing[index]['revision'],
      //                           style: const TextStyle(
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.w400,
      //                             fontFamily: "NotoSerif",
      //                           ),
      //                         ),
      //                         Text(
      //                           _pricing[index]['Layout'],
      //                           style: const TextStyle(
      //                             fontSize: 20,
      //                             fontWeight: FontWeight.w400,
      //                             fontFamily: "NotoSerif",
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
