import 'package:Trip/client/base_client.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  String? token;

  Future<void> sendOtp() async {
    try {
      final response = await BaseClient.post(
        api: EndPoints.sendOtp,
        data: {"phoneNumber": phoneNumber.text},
      );
      print(
          '============================================================================');
      token = response.item2!['verifyToken'];
      print('token: ${token}');
      //print(response);
    } catch (e) {
      print(
          '============================================================================');
      throw e; // Rethrow the error to be caught by the caller
    }
  }

  Future<void> verifyOtp() async {
    try {
      final response = await BaseClient.post(
        api: EndPoints.sendOtp,
        data: {"phoneNumber": phoneNumber.text},
      );
      print(
          '============================================================================');
      token = response.item2.data;
      print('response.item2.data: ${token}');
      print(response);
    } catch (e) {
      print(
          '============================================================================');
      throw e; // Rethrow the error to be caught by the caller
    }
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
