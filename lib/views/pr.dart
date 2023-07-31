import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: getDeviceHeight(context),
          width: getDeviceWidth(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/complete.png"),
            ),
          ),
        ),
      ),
    );
  }
}
