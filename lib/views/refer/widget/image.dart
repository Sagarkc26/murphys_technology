import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ReferImage extends StatelessWidget {
  const ReferImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getDeviceHeight(context) * 0.25,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage("images/referimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
