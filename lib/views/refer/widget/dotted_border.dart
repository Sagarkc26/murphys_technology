import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:provider/provider.dart';

import '../../provider/userdata.dart';

class ReferDottedBorder extends StatelessWidget {
  const ReferDottedBorder({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    // final referralModel = Provider.of<ReferralCodeModel>(context);
    return DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 2,
      dashPattern: const [8, 8, 8, 8],
      radius: const Radius.circular(12),
      child: Container(
        height: getDeviceHeight(context) * 0.11,
        width: getDeviceWidth(context),
        decoration: const BoxDecoration(),
        child: Center(child: Consumer<UserProvider>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your referral code",
                  style: TextStyle(
                    fontSize: getDeviceWidth(context) * 0.036 +
                        getDeviceHeight(context) * 0.0008,
                    fontFamily: "Poppins",
                  ),
                ),
                SelectableText(
                  "${value.referralCode}",
                  style: TextStyle(
                    fontSize: getDeviceWidth(context) * 0.075 +
                        getDeviceHeight(context) * 0.0008,
                    color: const Color(0xff1C6BFE),
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
