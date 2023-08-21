import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:url_launcher/url_launcher.dart';

class SMS extends StatelessWidget {
  const SMS({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff1C6BFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          final Uri url = Uri(
            scheme: "sms",
            path: '0488853623',
          );
          await launchUrl(url);
          // if (await canLaunchUrl(url)) {
          //   await launchUrl(url);
          // } else {
          //   print("show dialog: cannot launch this url");
          // }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.sms,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Send SMS",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
