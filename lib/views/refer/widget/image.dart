import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ReferImage extends StatelessWidget {
  const ReferImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/free-photo/3d-digital-landscape-modern-technology-background_1048-10465.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}
