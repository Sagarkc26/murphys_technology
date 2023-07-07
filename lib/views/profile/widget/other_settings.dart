import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class OtherSettings extends StatelessWidget {
  const OtherSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: getDeviceHeight(context),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 177, 209, 242),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Other Settings",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.black54,
            ),
            Text(
              'Delete Account',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
