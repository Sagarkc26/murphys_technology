import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/provider/delete_account.dart';
import 'package:murphys_technology/views/provider/userdata.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherSettings extends StatefulWidget {
  OtherSettings({
    super.key,
  });

  @override
  State<OtherSettings> createState() => _OtherSettingsState();
}

class _OtherSettingsState extends State<OtherSettings> {
  // String userId = '64d3169937cde5de252c1dbd';
  // Enter the user ID you want to delete

  Future<void> deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("accessToken");

    if (token != null) {
      try {
        const ApiUrl = Api.appurl;
        const apiUrl = '$ApiUrl:3000';
        final userId = prefs.getString("id");
        final deleteUrl = '$apiUrl/deleteUser/64d339af37cde5de252c1def';

        final response = await http.delete(
          Uri.parse(deleteUrl),
          headers: {
            "Authorization": "Bearer $token",
          },
        );

        if (response.statusCode == 200) {
          Utils.flushErrorMessage(
              "Account deleted Successfully", context, Colors.green);
          // Account deleted successfully
          // You can navigate to a different screen or show a success message
        } else {
          // Handle error scenario
        }
      } catch (e) {
        // Handle error scenario
      }
    } else {
      // Token not available, handle error
    }
  }

  // Future<void> deleteUser(BuildContext context) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final accessToken = prefs.getString("accessToken");
  //   final userId = prefs.getString('id');

  //   if (accessToken == null || userId == null) {
  //     print("accessToken & userId not available");
  //     return;
  //   }

  //   //Clear user data locally

  //   if (accessToken != null) {
  //     const apiUrl = Api.appurl;
  //     final deleteUrl = "$apiUrl/users/$userId";

  //     final uri = Uri.parse(deleteUrl);
  //     final response = await http
  //         .delete(uri, headers: {"Authorization": "Bearer $accessToken"});

  //     if (response.statusCode == 200) {
  //       await prefs.remove('accessToken');
  //       prefs.remove("name");
  //       prefs.remove("businessName");
  //       prefs.remove("referralCode");
  //       prefs.remove("id");
  //       print("Account deleted from server");
  //     } else {
  //       print("Error deleting account from server");
  //     }
  //   }
  //   // const apiUrl = Api.appurl;
  //   // final url = Uri.parse('$apiUrl/users/$userId');

  //   // final response = await http.delete(url);

  //   // if (response.statusCode == 200) {
  //   //   print('User deleted successfully');
  //   // } else {
  //   //   print('Error deleting user: ${response.body}');
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthModel>(context, listen: false);
    final userdata = Provider.of<UserProvider>(context, listen: false);
    return Container(
      height: getDeviceHeight(context) * 0.12,
      width: getDeviceHeight(context),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 177, 209, 242),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Other Settings",
              style: TextStyle(
                fontSize: getDeviceWidth(context) * 0.045 +
                    getDeviceHeight(context) * 0.0008,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.black54,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Delete Account'),
                    content: const Text('Do you want to delete your account?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () async {
                          final userProvider =
                              Provider.of<UserProvider>(context, listen: false);
                          await userProvider.deleteAccount();
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => LoginScreen(),
                          //   ),
                          //   (route) => false, // Clear all existing routes
                          // );
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: getDeviceWidth(context),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Delete Account',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: getDeviceWidth(context) * 0.045 +
                        getDeviceHeight(context) * 0.0008,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
