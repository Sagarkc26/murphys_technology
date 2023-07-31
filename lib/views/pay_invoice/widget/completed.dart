import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:murphys_technology/views/pay_invoice/widget/payment_completed.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  bool _showIcon = true;
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          _showIcon = !_showIcon;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoadingCompleted(),
          ),
        );
      },
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff447DF5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset(
                "animations/2.json",
                height: 300,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              "PAYMENT COMPLETED",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      // body: Center(
      //   child: AnimatedCrossFade(
      //     duration: Duration(milliseconds: 500),
      //     crossFadeState:
      //         _showIcon ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      //     firstChild: Icon(
      //       Icons.favorite,
      //       size: 50.0,
      //       color: Colors.blue,
      //     ),
      //     secondChild: Text(
      //       'Liked',
      //       style: TextStyle(
      //         fontSize: 30.0,
      //         color: Colors.blue,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Icon(
      //         Icons.check_circle,
      //         size: 60,
      //         color: Colors.white,
      //       ),
      //       AnimatedTextKit(
      //         animatedTexts: [
      //           RotateAnimatedText(
      //             'PAYMENT COMPLETED',
      //             textStyle: const TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //                 fontWeight: FontWeight.w500),
      //           ),
      //         ],
      //         totalRepeatCount: 1,
      //         pause: const Duration(
      //           milliseconds: 3000,
      //         ),
      //         displayFullTextOnTap: true,
      //         stopPauseOnTap: true,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
