import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  // static void fieldFocusChange(
  //     BuildContext context, FocusNode current, FocusNode nextfocus) {
  //   current.unfocus();
  //   FocusScope.of(context).requestFocus(nextfocus);
  // }

  // static toastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //   );
  // }

  static void flushErrorMessage(
      String message, BuildContext context, Color color) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.all(15),
        message: message,
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
      )..show(context),
    );
  }

  static snackBar(String message, Color? color, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: color,
        content: Text(message),
      ),
    );
  }
  // final snackBar = SnackBar(
  //   content: const Text('Hi, I am a SnackBar!'),
  //   backgroundColor: (Colors.black12),
  //   action: SnackBarAction(
  //     label: 'dismiss',
  //     onPressed: () {},
  //   ),
  // );
  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
