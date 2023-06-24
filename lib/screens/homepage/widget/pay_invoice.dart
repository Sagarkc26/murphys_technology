import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class PayInvoice extends StatelessWidget {
  const PayInvoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: getDeviceWidth(context) * 0.425,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 248, 249, 252),
            Color.fromARGB(255, 2, 88, 248),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0, 7),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/pay.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              "Pay Invoice",
              style: TextStyle(
                fontSize: 19,
                fontFamily: "Poppins",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
