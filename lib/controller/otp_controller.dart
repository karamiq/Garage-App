import 'package:Trip/client/base_client.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/controller/current_user_controller.dart';
import 'package:Trip/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Profiles/profile.dart';

class OtpController extends GetxController {
  bool isLoading = false;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  String? verifyToken;
  String? token;

  Future<void> sendOtp() async {
    try {
      final response = await BaseClient.post(
        api: EndPoints.sendOtp,
        data: {"phoneNumber": phoneNumber.text},
      );
      verifyToken = response.item2['verifyToken'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', verifyToken!);
      print('verifyToken: ${verifyToken}');
    } catch (e) {
      throw e;
    }
  }

  Future<void> verifyOtp() async {
    isLoading = true;
    UserController userController = Get.put<UserController>(UserController());
    try {
      final response = await BaseClient.post(
        api: EndPoints.verifyOtp,
        data: {"code": otpCode.text},
      );
      token = response.item2?['token'];
      prefs.setString('token', token!);
      userController.currentuUser = Driver.fromJson(response.item2['driver']);
    } catch (e) {
      isLoading = false;
      throw e;
    }
    isLoading = false;
  }

  String? validator(String? query) {
    if (query != '100000') {
      return 'الرمز خاطء';
    } else {
      return null;
    }
  }

  void printVariables() {
    print('Phone Number: ${phoneNumber.text}');
    print('OTP Code: ${otpCode.text}');
  }
}
