import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ReferDottedBorder extends StatelessWidget {
  const ReferDottedBorder({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 2,
      dashPattern: const [8, 8, 8, 8],
      radius: const Radius.circular(12),
      child: Container(
        height: 120,
        width: getDeviceWidth(context),
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your referral code",
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SelectableText(
                text,
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
