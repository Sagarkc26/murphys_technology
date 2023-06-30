import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:share_plus/share_plus.dart';

class ShareCode extends StatelessWidget {
  const ShareCode({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: getDeviceWidth(context) * 0.8,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff1C6BFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () async {
              await Share.share(text);
            },
            child: const Text(
              "Share your referral code",
              style: TextStyle(
                fontSize: 17,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
