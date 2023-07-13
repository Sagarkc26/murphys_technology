import 'package:flutter/material.dart';

Widget list(String text, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.9),
          size: 24,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.9),
            fontFamily: "Poppins",
          ),
        ),
      ],
    ),
  );
}
