import 'package:flutter/material.dart';

import '../constant.dart';

BoxShadow defaultShadow = BoxShadow(
  color: Get.isDarkMode
      ? Theme.of(Get.context!).colorScheme.primary.withOpacity(0)
      : Colors.black.withOpacity(0.05),
  blurRadius: 15,
  spreadRadius: 0.5,
  offset: const Offset(0, 0),
);

class BorderSize {
  static double circle = 10000;
  static double exLarge = 40;
  static double large = 30;
  static double medium = 20;
  static double small = 10;
  static double exSmall = 5;
  static double defaultSize = 20;
}

class Insets {
  // static double exLarge = Device.get().isPhone ? 40 : 50;
  // static double large = Device.get().isPhone ? 30 : 40;
  // static double medium = Device.get().isPhone ? 20 : 30;
  // static double small = Device.get().isPhone ? 10 : 20;
  // static double exSmall = Device.get().isPhone ? 5 : 10;
  static double exLarge = 40;
  static double large = 30;
  static double medium = 20;
  static double small = 10;
  static double exSmall = 5;
}

class CustomPageTheme {
  static const double veryBigpadding = 28;
  static const double bigPadding = 24;
  static const double meduimPadding = 20;
  static const double normalPadding = 16;
  static const double smallPadding = 8;
}

class CustomFontsTheme {
  static const bigWeight = FontWeight.w700;
  static const mediumWeight = FontWeight.w500;
  static const double veryBigSize = 34;
  static const double bigSize = 24;
  static const normalWeight = FontWeight.w400;
  static const double  mediumSize= 16;
  static const double  normalSize= 14;
}

class CoustomBorderTheme {
  static const double normalBorderRaduis = 16;
  static const double borderWidth = 2;
}

class CustomColorsTheme {
  static const Color lightHeadLineColor = Color.fromARGB(255, 231, 240, 245);
  static const Color availableRadioColor = Color.fromARGB(255, 21, 102, 101);
  static const Color unAvailableRadioColor = Color.fromARGB(255, 186, 26, 26);
  static const Color headLineColor = Color.fromARGB(255, 0, 101, 132);
  static const Color descriptionColor = Color.fromARGB(255, 112, 120, 125);
  static const Color scaffoldBackGroundColor =
      Color.fromARGB(255, 251, 252, 254);
  static const Color dividerColor = Color.fromARGB(255, 236, 235, 235);
  static const Color buttonColor = Color.fromARGB(255, 191, 216, 225);
  static const Color starColor = Color.fromARGB(255, 240, 128, 16);
  static const Color handColor = Color.fromARGB(255, 213, 215, 221);
  static const Color calenderTextColor = Color.fromARGB(255, 160, 160, 160);
  static const Color rangeHighlightColor = Color.fromARGB(255, 208, 227, 232);
}

class CoustomIconTheme {
  static const double verySmallize = 15;
  static const double smallize = 18;
  static const double normalSize = 35;
}

class RandomStuffTheme {
  static const double logoSize = 40;
}
