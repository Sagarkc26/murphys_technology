import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pricing/widget/creditcard.dart';

class Prac extends StatefulWidget {
  String? map;
  Prac({
    Key? key,
    this.map,
  }) : super(key: key);

  @override
  State<Prac> createState() => _PracState();
}

class _PracState extends State<Prac> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Total price",
                  style: TextStyle(
                    fontSize: 22,
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
                    fontSize: 45,
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
                    fontSize: 22,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://play-lh.googleusercontent.com/bDCkDV64ZPT38q44KBEWgicFt2gDHdYPgCHbA3knlieeYpNqbliEqBI90Wr6Tu8YOw",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CreditCard(plan: widget.map.toString()),
                        )),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://www.maya.ph/hubfs/Maya/Pay%20using%20Maya%20Card/Frame%2019382%20(2).png'),
                                fit: BoxFit.contain),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   height: 80,
                //   width: getDeviceWidth(context),
                //   decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 184, 208, 249),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.symmetric(
                //             vertical: 10, horizontal: 5),
                //         child: Container(
                //           height: 60,
                //           width: 60,
                //           decoration: const BoxDecoration(
                //               image: DecorationImage(
                //             image: NetworkImage(
                //                 "https://www.maya.ph/hubfs/Maya/Pay%20using%20Maya%20Card/Frame%2019382%20(2).png"),
                //             fit: BoxFit.cover,
                //           )),
                //         ),
                //       ),
                //       SizedBox(
                //         width: getDeviceWidth(context) * 0.1,
                //       ),
                //       const Text(
                //         "Credit Card",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontFamily: "Poppins",
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // Container(
                //   height: 80,
                //   width: getDeviceWidth(context),
                //   decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 184, 208, 249),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 5, vertical: 10),
                //         child: Container(
                //           height: 60,
                //           width: 60,
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(10),
                //               image: const DecorationImage(
                //                 image: NetworkImage(
                //                     "https://play-lh.googleusercontent.com/bDCkDV64ZPT38q44KBEWgicFt2gDHdYPgCHbA3knlieeYpNqbliEqBI90Wr6Tu8YOw"),
                //                 fit: BoxFit.cover,
                //               )),
                //         ),
                //       ),
                //       SizedBox(
                //         width: getDeviceWidth(context) * 0.1,
                //       ),
                //       const Text(
                //         "PayPal",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontFamily: "Poppins",
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: getDeviceHeight(context) * 0.02,
                ),
              ],
            ),
            // Column(
            //   children: [
            //     Center(
            //       child: SizedBox(
            //         height: 50,
            //         width: getDeviceWidth(context) * 0.8,
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: const Color(0xff1C6BFE),
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(20),
            //             ),
            //           ),
            //           onPressed: () {},
            //           child: const Text(
            //             "Proceed to confirm",
            //             style: TextStyle(
            //                 fontSize: 17,
            //                 fontWeight: FontWeight.w500,
            //                 fontFamily: "Poppins,"),
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 50,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
