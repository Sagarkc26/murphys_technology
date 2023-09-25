import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 177, 209, 242),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contact Information",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.045 +
                    getDeviceHeight(context) * 0.0008,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Email Address",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "info@murthystechnology.com",
                  style: TextStyle(
                    fontSize: getDeviceWidth(context) * 0.035 +
                        getDeviceHeight(context) * 0.0008,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 5),
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: getDeviceWidth(context) / 18,
                //         vertical: getDeviceHeight(context) / 100),
                //     decoration: BoxDecoration(
                //       color: const Color(0xff39393c).withOpacity(0.7),
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Edit",
                //         style: TextStyle(
                //           fontSize: getDeviceWidth(context) / 25,
                //           fontWeight: FontWeight.w600,
                //           color: Colors.white.withOpacity(0.9),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
