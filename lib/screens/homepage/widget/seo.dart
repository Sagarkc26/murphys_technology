import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class Seo extends StatelessWidget {
  const Seo({
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
            // Color(0xff8CF3CD),
            // Color(0xff4EE4A9),
            Color.fromARGB(255, 213, 245, 232),
            Color.fromARGB(255, 3, 89, 251),
            // Color.fromARGB(255, 245, 248, 255),
            // Color.fromARGB(255, 26, 105, 252),
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
                  image: AssetImage("images/seo.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "SEO",
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
