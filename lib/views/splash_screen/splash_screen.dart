import 'dart:async';
import 'package:flutter/material.dart';
import 'package:murphys_technology/views/IntroductionPage/int.dart';
import 'package:murphys_technology/views/bottomNavBar/bot.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlutterSplashScreen.fadeIn(
//         duration: const Duration(seconds: 2),
//         gradient: const LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             // Color(0xff982282),
//             // Color(0xffEEA863),
//             Colors.black,
//             Colors.black87,
//           ],
//         ),
//         childWidget: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: 70,
//               vertical: MediaQuery.of(context).size.height * 0.1),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 250,
//                   width: 200,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("images/logo.png"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         defaultNextScreen: const IntSlider(),
//       ),
//     );
//   }
// }
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();
    // TODO: implement initState
    super.initState();
  }

  void navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("accessToken");

    Timer(const Duration(seconds: 2), () {
      if (accessToken != null) {
        if (accessToken != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNB(index: 1),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IntSlider(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const IntSlider(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
          ],
        ),
      ),
    );
  }
}
