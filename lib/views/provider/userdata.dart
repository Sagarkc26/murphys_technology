import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String accessToken = "";
  String name = "";
  String businessName = "";
  String email = "";
  String id = "";
  String referralCode = "";

  //Function to get the first letter of the first name
  String get firstNameInitial {
    if (name.isNotEmpty) {
      final nameParts = name.split(" ");
      if (nameParts.isNotEmpty) {
        return nameParts[0][0];
      }
    }
    return '';
  }

  // Function to get the first letter of the last name
  String get lastNameInitial {
    if (name.isNotEmpty) {
      final nameParts = name.split(" ");
      if (nameParts.length > 1) {
        return nameParts[1][0];
      }
    }
    return "";
  }

  void setUserData(
    String token,
    String newName,
    String newBusinessName,
    String newEmail,
    String newId,
    String newReferralCode,
  ) {
    accessToken = token;
    name = newName;
    businessName = newBusinessName;
    email = newEmail;
    id = newId;
    referralCode = newReferralCode;
    _saveDataToSharedPreferences();
    notifyListeners();
  }

  void clearUserData() {
    accessToken = "";
    name = "";
    businessName = "";
    email = "";
    id = "";
    referralCode = "";
    _clearDataFromSharedPreferences();
    notifyListeners();
  }

  Future<void> _saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", accessToken);
    prefs.setString("name", name);
    prefs.setString("businessName", businessName);
    prefs.setString("email", email);
    prefs.setString("id", id);
    prefs.setString("referralCode", referralCode);
  }

  Future<void> _clearDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
    prefs.remove("name");
    prefs.remove("businessName");
    prefs.remove("email");
    prefs.remove("id");
    prefs.remove("referralCode");
  }

  Future<void> loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("accessToken") ?? "";
    name = prefs.getString("name") ?? "";
    businessName = prefs.getString("businessName") ?? "";
    email = prefs.getString("email") ?? "";
    id = prefs.getString("id") ?? "";
    referralCode = prefs.getString("referralCode") ?? "";
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
    //Clear other user-related data if needed

    //Update the state
    clearUserData();
  }

  Future<void> deleteUser(String userId) async {
    const ApiUrl = Api.appurl;
    final apiUrl = '$ApiUrl/users/$userId';

    try {
      final response = await http.delete(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        print('User deleted successfully');
        clearUserData();
      } else if (response.statusCode == 404) {
        print('User not found');
      } else {
        print('Failed to delete user');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
