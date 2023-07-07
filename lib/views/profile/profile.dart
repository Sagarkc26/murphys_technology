import 'package:flutter/material.dart';
import 'package:murphys_technology/views/profile/widget/contact_information.dart';
import 'package:murphys_technology/views/profile/widget/other_settings.dart';
import 'package:murphys_technology/utils/device_size.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selected = "";
  bool? isChecked = false;
  bool? isChecke = false;
  List<Map> checkListItems = [
    {
      "id": 0,
      "value": true,
      "title": "Notification on",
    },
    {
      "id": 1,
      "value": false,
      "title": "Notification off",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: getDeviceHeight(context) * 0.85,
                  width: getDeviceWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 250,
                          width: getDeviceWidth(context),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff762C8B),
                                Color(0xff5496FE),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 70,
                              bottom: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ContactInformation(),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 160,
                                  width: getDeviceWidth(context),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 177, 209, 242),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Notificatin Settings",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Column(
                                          children: List.generate(
                                            checkListItems.length,
                                            (index) => CheckboxListTile(
                                              title: Text(
                                                checkListItems[index]['title'],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              value: checkListItems[index]
                                                  ['value'],
                                              onChanged: (value) {
                                                setState(() {
                                                  for (var element
                                                      in checkListItems) {
                                                    element['value'] = false;
                                                  }
                                                  checkListItems[index]
                                                      ['value'] = value;
                                                  selected =
                                                      "${checkListItems[index]['id']},${checkListItems[index]['title']},${checkListItems[index]['value']},";
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     const Text(
                                        //       'Notification on',
                                        //       style: TextStyle(
                                        //         fontSize: 18,
                                        //         fontWeight: FontWeight.w500,
                                        //         fontFamily: "Poppins",
                                        //       ),
                                        //     ),
                                        //     Checkbox(
                                        //       value: isChecked,
                                        //       activeColor: Colors.blue,
                                        //       onChanged: (value) {
                                        //         setState(() {
                                        //           isChecked = value;
                                        //         });
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     const Text(
                                        //       'Notification off',
                                        //       style: TextStyle(
                                        //         fontSize: 18,
                                        //         fontWeight: FontWeight.w500,
                                        //         fontFamily: "Poppins",
                                        //       ),
                                        //     ),
                                        //     Checkbox(
                                        //       value: isChecke,
                                        //       activeColor: Colors.blue,
                                        //       onChanged: (value) {
                                        //         setState(() {
                                        //           isChecke = value;
                                        //         });
                                        //       },
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const OtherSettings()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: getDeviceWidth(context) * 0.25,
                  top: 60,
                  child: Container(
                    height: 50,
                    width: getDeviceWidth(context) * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: getDeviceHeight(context) * 0.16,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg/678px-Elon_Musk_Royal_Society_%28crop2%29.jpg"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: getDeviceHeight(context) * 0.19,
                  left: 160,
                  child: Text(
                    "Murphys Technology",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
