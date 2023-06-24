import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class Free_consultant extends StatelessWidget {
  const Free_consultant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: getDeviceWidth(context) * 0.425,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            spreadRadius: 0.5,
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color(0xff8AD5FF),
            // Color(0xff60BCEC),
            Color.fromARGB(255, 3, 88, 245),
            Color.fromARGB(255, 252, 252, 253),
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
                  image: AssetImage("images/free_consultant.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Free Consultant",
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
