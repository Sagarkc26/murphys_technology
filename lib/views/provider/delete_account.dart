import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:murphys_technology/api/apiurl.dart';

class AuthModel extends ChangeNotifier {
  // ... other properties and methods ...

  Future<void> deleteAccount(String userId, String token) async {
    const apiUrl = Api.appurl;
    final deleteUrl = '$apiUrl/deleteUser/$userId';

    try {
      final response = await http.delete(
        Uri.parse(deleteUrl),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        print("object");
        // Account deleted successfully
        // You can notify listeners or perform other actions as needed
      } else {
        // Handle error scenario
      }
    } catch (e) {
      // Handle error scenario
    }
  }
}
