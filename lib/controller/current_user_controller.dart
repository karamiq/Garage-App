import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:Trip/config/constant.dart';
import 'package:Trip/model/Profiles/profile.dart';

class UserController extends GetxController {
  Profile? currentuUser;

  @override
  void onInit() {
    super.onInit();
    loadUserFromPreferences();
  }

  // Save currentUser to shared preferences
  Future<void> saveUserToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (currentuUser != null) {
      prefs.setString('currentUser', jsonEncode(currentuUser!.toJson()));
    }
  }

  // Load currentUser from shared preferences
  Future<void> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('currentUser');
    if (userString != null) {
      currentuUser = Profile.fromJson(jsonDecode(userString));
    }
  }

  // Remove currentUser from shared preferences
  Future<void> removeUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('currentUser');
    currentuUser = null;
  }
}
