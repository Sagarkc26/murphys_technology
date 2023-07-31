import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:murphys_technology/routes/routesName.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/freeQuote/free_quote.dart';

class Servicess extends StatefulWidget {
  String name;
  String description;
  String image;
  String rating;
  String price;
  Servicess({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  State<Servicess> createState() => _ServicessState();
}

class _ServicessState extends State<Servicess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
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
                          // GestureDetector(
                          //   onTap: () => Navigator.pop(context),
                          //   child: Container(
                          //     height: 47,
                          //     width: 47,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white54,
                          //       shape: BoxShape.circle,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           blurRadius: 15,
                          //           offset: const Offset(0, 6),
                          //           color: Colors.black87.withOpacity(0.4),
                          //         ),
                          //       ],
                          //     ),
                          //     child: const Center(
                          //       child: Icon(
                          //         Icons.arrow_back_rounded,
                          //         size: 32,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Text(
                            "Details",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.75),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15,
                                  offset: const Offset(0, 3),
                                  color: Colors.black87.withOpacity(0.4),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                size: 32,
                                color: Colors.red,
                              ),
                            ),
                          ),
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
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
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
                            widget.name,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.75),
                              fontSize: 20,
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
                                      widget.rating,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Poppins",
                                        color: Colors.black.withOpacity(0.7),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
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
                        height: 150,
                        width: getDeviceWidth(context),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            widget.description,
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
            // ClipPath(
            //   child: Container(
            //     height: 100,
            //     color: Colors.green,
            //     width: getDeviceWidth(context),
            //   ),
            //   clipper: CustomClipPaths(),
            // ),
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
                              children: [
                                const Text(
                                  "Approximate",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Text(
                                  widget.price,
                                  style: const TextStyle(
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
            // ClipPath(
            //   clipper: CustomClipPaths(),
            //   child: Container(
            //     height: getDeviceHeight(context) * 0.1,
            //     decoration: const BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Color(0xff762C8B),
            //           Color(0xff5496FE),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// class CustomClipPaths extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double w = size.width;
//     double h = size.height;

//     final path = Path();
//     path.lineTo(0, h);
//     path.lineTo(h, w);
//     path.lineTo(w, 0);
//     path.close();
//     // path.lineTo(w / 2, h);
//     // path.lineTo(w / 2, h);
//     // path.lineTo(w, 0);

//     // path.lineTo(0, h);
//     // path.quadraticBezierTo(
//     //   w / 2,
//     //   h,
//     //   w,
//     //   h / 2,
//     // );
//     // path.lineTo(size.width, 0);
//     // path.lineTo(0, size.height);
//     // path.lineTo(size.width / 2, size.height - 50);
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(size.width, 0);
//     // path.close();
//     // path.lineTo(h, w);
//     // path.quadraticBezierTo(w * 0.5, h - 100, w, h);
//     // path.lineTo(w, 0);
//     // path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
// }
