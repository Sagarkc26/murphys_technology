import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/utils/utils.dart';

class CopyCode extends StatelessWidget {
  const CopyCode({
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
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: text),
              );
              Utils.flushErrorMessage(
                "Referral Code copied",
                context,
                Colors.green.withOpacity(0.7),
              );
            },
            child: Text(
              "Copy referral code",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.035 +
                    getDeviceHeight(context) * 0.0008,
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
