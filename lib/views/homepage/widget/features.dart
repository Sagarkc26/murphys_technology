import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/branding/branding.dart';
import 'package:murphys_technology/views/freeQuote/free_quote.dart';
import 'package:murphys_technology/views/pay_invoice/pay_invoice.dart';

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
            Get.to(() => const PayInvoice(), transition: Transition.upToDown);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(35),
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
              Text(
                "Pay Invoice",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.032 +
                      getDeviceHeight(context) * 0.0008,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const BrandingScreen(),
                transition: Transition.circularReveal);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(35),
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
              Text(
                "Branding",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.032 +
                      getDeviceHeight(context) * 0.0008,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => const FreeQuote(), transition: Transition.zoom);
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(35),
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
              Text(
                "Free Quote",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.032 +
                      getDeviceHeight(context) * 0.0008,
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
