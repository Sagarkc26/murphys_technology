import 'package:flutter/material.dart';
import 'package:murphys_technology/views/refer/widget/copy_code.dart';
import 'package:murphys_technology/views/refer/widget/dotted_border.dart';
import 'package:murphys_technology/views/refer/widget/image.dart';
import 'package:murphys_technology/views/refer/widget/share_code.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  String text = "Referral Code";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Refer a friend &",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              const Text(
                "Get 10% off",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Get 10% off on your next subscription",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                "if your friend subscribe",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ReferImage(),
              const SizedBox(
                height: 25,
              ),
              ReferDottedBorder(text: text),
              const SizedBox(
                height: 25,
              ),
              CopyCode(text: text),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Or Share On",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ShareCode(text: text),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 45,
              //       width: 45,
              //       decoration: BoxDecoration(
              //         color: Colors.blue,
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: const Icon(
              //         Icons.facebook,
              //         color: Colors.white,
              //         size: 35,
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 8,
              //     ),
              //     Container(
              //       height: 45,
              //       width: 45,
              //       decoration: BoxDecoration(
              //         color: const Color(0xff66d4ad),
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       child: const Icon(
              //         Icons.email,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 8,
              //     ),
              //     Container(
              //       height: 45,
              //       width: 45,
              //       decoration: BoxDecoration(
              //         color: const Color(0xff7DD889),
              //         borderRadius: BorderRadius.circular(12),
              //         image: const DecorationImage(
              //           image: AssetImage("images/whatsapp.png"),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 8,
              //     ),
              //     Container(
              //       height: 48,
              //       width: 48,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12),
              //         image: const DecorationImage(
              //           image: AssetImage(
              //             "images/instagram.png",
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
