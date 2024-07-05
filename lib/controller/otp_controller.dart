import 'package:Trip/client/base_client.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/controller/current_user_controller.dart';
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
      isLoading = true; // Set loading to true before API call
      update(); // Notify listeners of the change
      final response = await BaseClient.post(
        api: EndPoints.sendOtp,
        data: {"phoneNumber": phoneNumber.text},
      );
      verifyToken = response.item2['verifyToken'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', verifyToken!);
      print('verifyToken: ${verifyToken}');
    } catch (e) {
      print(e);
    } finally {
      isLoading = false; // Set loading back to false after API call
      update(); // Notify listeners of the change
    }
  }

  Future<void> verifyOtp() async {
    isLoading = true; // Set loading to true before API call
    update(); // Notify listeners of the change
    UserController userController = Get.put<UserController>(UserController());
    try {
      final response = await BaseClient.post(
        api: EndPoints.verifyOtp,
        data: {"code": otpCode.text},
      );
      token = response.item2?['token'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token!);
      userController.currentuUser = Profile.fromJson(response.item2['driver']);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false; // Set loading back to false after API call
      update(); // Notify listeners of the change
    }
  }

  String? validator(String? query) {
    if (query != '100000') {
      return 'الرمز خاطئ';
    } else {
      return null;
    }
  }

  void printVariables() {
    print('Phone Number: ${phoneNumber.text}');
    print('OTP Code: ${otpCode.text}');
  }
}
