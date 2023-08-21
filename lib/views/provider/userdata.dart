import 'package:flutter/material.dart';
import 'package:murphys_technology/api/apiurl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String accessToken = "";
  String name = "";
  String businessName = "";
  String referralCode = '';
  String id = '';

  void setUserData(
    String token,
    String newName,
    String newBusinessName,
    String newreferralCode,
    String id,
  ) {
    accessToken = token;
    name = newName;
    businessName = newBusinessName;
    referralCode = newreferralCode;
    id = id;
    _saveDataToSharedPreferences();
    notifyListeners();
  }

  void clearUserData() {
    accessToken = "";
    name = "";
    businessName = "";
    referralCode = "";
    id = '';
    notifyListeners();
  }

  Future<void> _saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", accessToken);
    prefs.setString("name", name);
    prefs.setString("businessname", businessName);
    prefs.setString("referralCode", referralCode);
    prefs.setString("id", id);
  }

  Future<void> loadDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString("accessToken") ?? "";
    name = prefs.getString("name") ?? "";
    businessName = prefs.getString("businessname") ?? "";
    referralCode = prefs.getString("referralCode") ?? "";
    id = prefs.getString('id') ?? "";
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('accessToken');
    //Clear other user-related data if needed

    //Update the state
    clearUserData();
  }

  Future<void> deleteAccount() async {
    try {
      const apiUrl = Api.appurl;
      final deleteUrl = '$apiUrl/deleteUsers/$id';

      final response = await http.delete(Uri.parse(deleteUrl), headers: {
        "Authorization": 'Bearer $accessToken',
      });

      if (response.statusCode == 200) {
        logout();
        clearUserData();
      } else {
        print('Error deleting account: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting account: $e');
    }
  }
}
