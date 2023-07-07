import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Loading:",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SpinKitThreeBounce(
              color: Color(0xff1C6BFE),
              size: 35,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: 140,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1C6BFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: "Poppins",
                    ),
                  )),
            )
          ],
        ),
        // child: SpinKitRotatingCircle(
        //   color: Colors.blue,
        //   size: 50.0,
        // ),
      )),
    );
  }
}
