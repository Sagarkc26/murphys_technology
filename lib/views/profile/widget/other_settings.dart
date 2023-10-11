import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:murphys_technology/utils/device_size.dart';
import 'package:murphys_technology/utils/utils.dart';
import 'package:murphys_technology/views/login.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;
  String hashedPassword = '';
  bool correctPassword = false;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
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
                showDeleteConfirmationDialog();
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

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Delete Account",
          style: TextStyle(color: Colors.red),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Do you want to delete your account?"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              showPasswordInputDialog();
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void showPasswordInputDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Deletion"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Click Confirm button to delete account"),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      togglePasswordVisibility();
                    },
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                hintText: "Current Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final savedPassword = prefs.getString("password");
              String? id = prefs.getString("id");
              setState(() {
                hashedPassword =
                    BCrypt.hashpw(_passwordController.text, BCrypt.gensalt());
              });
              setState(() {
                correctPassword = BCrypt.checkpw(
                    _passwordController.text, savedPassword.toString());
              });

              if (_passwordController.text.isNotEmpty) {
                if (correctPassword) {
                  final userProvider =
                      Provider.of<UserProvider>(context, listen: false);
                  await userProvider.deleteUser(id.toString());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                  Utils.flushErrorMessage("Account deleted Successfully",
                      context, Colors.greenAccent);
                } else {
                  Utils.flushErrorMessage(
                      "Incorrect Password", context, Colors.red);
                }
              } else {
                Utils.flushErrorMessage(
                    "Enter your password", context, Colors.blue);
              }

              // if (savedPassword != null) {
              //   final enteredPasswordHash = hashPassword(enteredPassword);
              //   if (savedPassword == enteredPasswordHash) {
              //     Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const LoginScreen(),
              //         ),
              //         (route) => false);
              //     final userProvider =
              //         Provider.of<UserProvider>(context, listen: false);
              //     await userProvider.deleteUser(id.toString());

              //     Utils.flushErrorMessage(
              //         "Account Deleted Successfully", context, Colors.blue);
              //     print("Password match");
              //   }
              // } else {
              //   print('No saved password found in SharedPreferences');
              // }
              // if (savedPassword != null && savedPassword == enteredPassword) {
              //   Navigator.pushAndRemoveUntil(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const LoginScreen(),
              //       ),
              //       (route) => false);
              //   final userProvider =
              //       Provider.of<UserProvider>(context, listen: false);
              //   await userProvider.deleteUser(id.toString());

              //   Utils.flushErrorMessage(
              //       "Account Deleted Successfully", context, Colors.blue);
              //   print("Password match");
              // } else {
              //   print("Password does not match");
              // }
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
