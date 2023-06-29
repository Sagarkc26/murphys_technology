import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({
    super.key,
    required this.message,
    required this.icon,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 200,
          child: Row(
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          height: 42,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              SizedBox(
                height: 30,
                width: 30,
                child: Icon(
                  Icons.headset_mic_outlined,
                  size: 20,
                ),
              ),
              Text(
                "Services",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 28,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
