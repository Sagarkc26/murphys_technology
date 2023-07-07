import 'package:flutter/material.dart';

class List2 extends StatelessWidget {
  const List2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Card number",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 40,
                width: 70,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/paypal.png"))),
              ),
            ),
            hintText: "* * * *  * * * *  * * * *  * * * *",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Valid Until",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Month / Year",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CVV",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "* * * *",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Card holder",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Your name and surname",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
