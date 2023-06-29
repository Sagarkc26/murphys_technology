import 'package:flutter/material.dart';

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
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
          ),
        ),
        Text(
          "coffee’s on us",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            fontWeight: FontWeight.bold,
            fontFamily: "NotoSerif",
          ),
        )
      ],
    );
  }
}
