import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/pay_invoice/widget/payment_completed.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // late AnimationController controller;

  // @override
  // void initState() {
  //   Timer timer;
  //   timer = Timer.periodic(const Duration(microseconds: 1000), (timer) {
  //     setState(() {
  //       _percent += 10;
  //       if (_percent >= 100) {
  //         timer.cancel();
  //       }
  //     });
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  double _percent = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundImage: Image.asset("images/loading.jpg", fit: BoxFit.cover),
        duration: const Duration(seconds: 5),
        animationDuration: const Duration(seconds: 5),
        backgroundColor: const Color.fromARGB(255, 202, 222, 242),
        childWidget: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Loading :",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    _percent.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      barRadius: const Radius.circular(40),
                      width: getDeviceWidth(context) * 0.7,
                      animation: true,
                      lineHeight: 5,
                      animationDuration: 5000,
                      percent: _percent,
                      // center: Text(
                      //   _percent.toString() + "%",
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //   ),
                      // ),
                      backgroundColor: Colors.grey[300],
                      progressColor: const Color(0xff1C6BFE),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        defaultNextScreen: const LoadingCompleted(),
      ),
    );
  }
}
