import 'package:flutter/material.dart';
import 'package:murphys_technology/routes/routesName.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.payinvoice);
          },
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/invoice.png"),
                  ),
                  color: Color.fromARGB(255, 249, 238, 242),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Pay Invoice",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RoutesName.branding),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/branding.png"),
                  ),
                  color: Color.fromARGB(255, 249, 238, 242),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Branding",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RoutesName.freequote),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/freeQuote.png"),
                    fit: BoxFit.contain,
                  ),
                  color: Color.fromARGB(255, 249, 238, 242),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "Free Quote",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
