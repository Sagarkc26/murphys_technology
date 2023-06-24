import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

// ignore: camel_case_types
class Other_services extends StatelessWidget {
  const Other_services({
    super.key,
    required this.ourServices,
  });

  final List<Map> ourServices;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: getDeviceWidth(context),
      child: PageView.builder(
        itemCount: ourServices.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              height: 180,
              width: getDeviceWidth(context),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 4, spreadRadius: 0.5),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 82, 139, 246),
                    Color.fromARGB(255, 195, 249, 227),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ourServices[index]['name'],
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
