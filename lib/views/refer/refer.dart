import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/views/provider/userdata.dart';
import 'package:murphys_technology/views/refer/widget/copy_code.dart';
import 'package:murphys_technology/views/refer/widget/dotted_border.dart';
import 'package:murphys_technology/views/refer/widget/image.dart';
import 'package:murphys_technology/views/refer/widget/share_code.dart';
import 'package:provider/provider.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  String text = "zWcDWQ2wSK";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 202, 222, 242),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getDeviceWidth(context) * 0.04,
            vertical: getDeviceHeight(context) * 0.02,
            // top: getDeviceHeight(context) * 0.02,
            // left: getDeviceWidth(context) * 0.04,
            // right: getDeviceWidth(context) * 0.04,
            // bottom: getDeviceHeight(context) * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Refer a friend &",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.065 +
                      getDeviceHeight(context) * 0.0008,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                "Get 10% off",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.065 +
                      getDeviceHeight(context) * 0.0008,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.01,
              ),
              Text(
                "Get 10% off on your next subscription",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.035 +
                      getDeviceHeight(context) * 0.0008,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Text(
                "if your friend subscribe",
                style: TextStyle(
                  fontSize: getDeviceWidth(context) * 0.035 +
                      getDeviceHeight(context) * 0.0008,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: getDeviceHeight(context) * 0.02,
              ),
              const ReferImage(),
              SizedBox(
                height: getDeviceHeight(context) * 0.03,
              ),
              const ReferDottedBorder(text: "referralCode"),
              const SizedBox(
                height: 25,
              ),
              const CopyCode(text: "referralCode"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Or Share On",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: getDeviceWidth(context) * 0.035 +
                          getDeviceHeight(context) * 0.0008,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<UserProvider>(
                builder: (context, value, child) {
                  return ShareCode(text: "${value.referralCode}");
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // String referralCode = 'Fetching...'; // Initial value

  // @override
  // void initState() {
  //   super.initState();
  //   fetchReferralCode();
  // }

  // Future<void> fetchReferralCode() async {
  //   const apiUrl = Api.appurl;
  //   final url = Uri.parse('$apiUrl/referralcode');

  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       referralCode = response.body;
  //     });
  //   } else {
  //     print('Error fetching referral code: ${response.statusCode}');
  //   }
  // }
}
