import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/views/login.dart';

class OtherSettings extends StatelessWidget {
  OtherSettings({
    super.key,
  });
  String userId =
      '64d2077bc3b0c5058103b3d3'; // Enter the user ID you want to delete

  Future<void> deleteUser() async {
    const apiUrl = Api.appurl;
    final url = Uri.parse('$apiUrl/users/$userId');

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      print('User deleted successfully');
    } else {
      print('Error deleting user: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            const Text(
              "Other Settings",
              style: TextStyle(
                fontSize: 20,
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
                        onPressed: () {
                          deleteUser();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
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
                child: const Text(
                  'Delete Account',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
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
