import 'package:flutter/material.dart';
import 'package:murphys_technology/views/startingpage/finish.dart';
import 'package:murphys_technology/utils/device_size.dart';

class Continue extends StatelessWidget {
  const Continue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //     image: AssetImage("images/image2.jpg"), fit: BoxFit.cover),
            ),
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
                  image: AssetImage("images/pic2.png"),
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
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
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
                        "We will create best website and app",
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return const Finish();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Continue",
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
