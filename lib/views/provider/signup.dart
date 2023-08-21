// // auth_model.dart

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:murphys_technology/api/apiurl.dart';

// class AuthModel extends ChangeNotifier {
//   // ... other properties and methods ...

//   Future<void> deleteUser(String userId) async {
//     try {
//       const apiUrl = Api.appurl;
//       final appurl = '$apiUrl/deleteUser/$userId';
//       final url = Uri.parse(appurl);
//       final response = await http.delete(url, headers: {
//         'Content-type': 'application/json',
//         'Authorization': 'Bearer ${yourAuthToken}', // Include the user's auth token
//       }).timeout(const Duration(seconds: 10));

//       if (response.statusCode == 200) {
//         // User deleted successfully
//         // Notify listeners or perform other actions as needed
//       } else {
//         // Handle other response status codes (e.g., show an error message)
//         // ...
//       }
//     } on TimeoutException {
//       // Handle timeout
//       // ...
//     } catch (error) {
//       // Handle other errors
//       // ...
//     }
//   }
// }
