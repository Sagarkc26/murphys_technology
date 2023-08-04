import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignUpController extends GetxController {
  final fullname = TextEditingController();
  final businessname = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  void registerUser(
      String fullname, String businessname, String phone, String password) {}
}
