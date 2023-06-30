import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Contact Information",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Email Address",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "info@murthystechnology.com",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    height: 35,
                    width: 65,
                    decoration: BoxDecoration(
                      color: const Color(0xff39393c).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
