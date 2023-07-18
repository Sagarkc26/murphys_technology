import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Mark all as read",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Poppins",
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              const Divider(
                color: Colors.white,
                height: 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
