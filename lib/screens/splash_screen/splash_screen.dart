import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/screens/IntroductionPage/int.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xff982282),
            // Color(0xffEEA863),
            Colors.black,
            Colors.black87,
          ],
        ),
        childWidget: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 70,
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        defaultNextScreen: const IntSlider(),
      ),
    );
  }
}
