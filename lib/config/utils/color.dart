import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusColor {
  static Color pending = Colors.yellow.shade100;
  static const Color delivered = Color(0xFF3FABB5);
  static const Color error = Color.fromRGBO(181, 63, 63, 1);
  static Color containerBackground = Get.isDarkMode
      ? Theme.of(Get.context!).colorScheme.secondary.withOpacity(0.1)
      : Theme.of(Get.context!).colorScheme.surface;
}