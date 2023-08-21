import 'package:flutter/material.dart';

import '../../../utils/device_size.dart';

class Titles extends StatelessWidget {
  const Titles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Drop us a line, ",
          style: TextStyle(
            fontSize: getDeviceWidth(context) * 0.045 +
                getDeviceHeight(context) * 0.0008,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        Text(
          "coffee’s on us",
          style: TextStyle(
            fontSize: getDeviceWidth(context) * 0.045 +
                getDeviceHeight(context) * 0.0008,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
            fontFamily: "NotoSerif",
          ),
        )
      ],
    );
  }
}
