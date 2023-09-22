import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/provider/notification.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.toggleSelectAll();
                      },
                      child: Text(
                        "Mark all as read",
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: "Poppins",
                          fontSize: getDeviceWidth(context) * 0.045 +
                              getDeviceHeight(context) * 0.0008,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Notifications",
                  style: TextStyle(
                    fontSize: getDeviceWidth(context) * 0.065 +
                        getDeviceHeight(context) * 0.0008,
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
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.notifications.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: ListTile(
                          title: const Text(
                            "Murphy's Technology",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: const Text(
                            "Your email has been sent successfully",
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: provider.showCheckboxes
                              ? Checkbox(
                                  value: provider.selectedList[index],
                                  onChanged: (isSelected) {
                                    // Update the selected status for this notification

                                    setState(() {
                                      provider.selectedList[index] =
                                          isSelected ?? false;
                                    }); // Rebuild to update UI
                                  },
                                )
                              : null,
                          trailing: provider.showCheckboxes
                              ? null
                              : IconButton(
                                  onPressed: () {
                                    provider.removeNotification(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: provider.showCheckboxes
                      ? const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        )
                      : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: provider.showCheckboxes
                      ? IconButton(
                          onPressed: provider.deleteSelected,
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
