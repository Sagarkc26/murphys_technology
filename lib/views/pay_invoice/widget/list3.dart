import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class List3 extends StatelessWidget {
  const List3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Our bank Account details",
          style: TextStyle(
            fontSize: getDeviceWidth(context) * 0.05 +
                getDeviceHeight(context) * 0.0008,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Bank :",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            Text(
              " NAB Bank of Australia",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Account number :",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            Text(
              " 16-567-2104",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "BSB :",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontWeight: FontWeight.bold,
                fontFamily: "Poppins",
              ),
            ),
            Text(
              " 082-908",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Note :",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.04 +
                    getDeviceHeight(context) * 0.0008,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                width: getDeviceWidth(context) * 0.7,
                child: Text(
                  "Please kindly proceed with the payment reference to above given bank account details.",
                  style: TextStyle(
                    fontSize: getDeviceWidth(context) * 0.04 +
                        getDeviceHeight(context) * 0.0008,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
