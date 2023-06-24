import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: getDeviceWidth(context) * 0.425,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 0.5),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            // Color(0xffFFBBB8),
            // Color(0xffFE8E8D),
            // Color.fromARGB(255, 144, 181, 249),
            // Color(0xff1C6BFE),
            Color.fromARGB(255, 3, 88, 245),
            Color.fromARGB(255, 217, 248, 236),

            // Color.fromARGB(255, 26, 105, 252),
            // Color.fromARGB(255, 245, 248, 255),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/services.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Services",
              style: TextStyle(
                fontSize: 19,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
