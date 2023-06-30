// import 'package:flutter/material.dart';

// class StartingPage extends StatefulWidget {
//   const StartingPage({super.key});

//   @override
//   State<StartingPage> createState() => _StartingPageState();
// }

// class _StartingPageState extends State<StartingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 100,
//                 width: 300,
//                 child: Text(
//                   "We help you to grow your business",
//                   style: TextStyle(
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//                 width: 250,
//                 child: Text(
//                   "Growing a business is hard. We make it a whole lot easier, more predictable, less stressful, and more fun.",
//                   style: TextStyle(
//                     fontSize: 17,
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 130,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(17),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text("Next"),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:murphys_technology/views/startingpage/continue.dart';
import 'package:murphys_technology/utils/device_size.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("images/logo.png"), fit: BoxFit.cover),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 350,
              width: getDeviceWidth(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/pic1.png"),
                ),
              ),
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.1,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.37,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(90),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "We help you to grow your business",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                              color: const Color(0xff1C6BFE),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: const Color(0xff1C6BFE),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: const Color(0xff1C6BFE),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1C6BFE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) {
                                return const Continue();
                              },
                            ));
                          },
                          child: const Text(
                            "Get Started",
                            style: TextStyle(fontSize: 18),
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
      ),
    );
  }
}
