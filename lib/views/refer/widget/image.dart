import 'package:flutter/material.dart';

class ReferImage extends StatelessWidget {
  const ReferImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(100),
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
