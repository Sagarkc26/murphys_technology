import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:murphys_technology/utils/device_size.dart';

class Servicess extends StatefulWidget {
  String name;
  String description;
  Servicess({
    Key? key,
    required this.name,
    required this.description,
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
                    height: getDeviceHeight(context) * 0.34,
                    width: getDeviceWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdni.iconscout.com/illustration/premium/thumb/blockchain-technology-service-3327889-2793793.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.02,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                              fontSize: 25,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: const Color(0xff7BCEF8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getDeviceHeight(context) * 0.015,
                      ),
                      SizedBox(
                        height: 140,
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
                                    "Aug 06,2023",
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
                    ),
                  ],
                ),
                Positioned(
                  left: getDeviceWidth(context) * 0.054,
                  child: Container(
                    height: 57,
                    width: 65,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 151, 150),
                      borderRadius: BorderRadius.circular(20),
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
