import 'package:flutter/material.dart';

import '../../../config/utils/const_class.dart';

class CardInfoContainer extends StatelessWidget {
  CardInfoContainer({super.key, required this.text, this.fontSize});
  final String text;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Insets.small, vertical: Insets.exSmall),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius:
              BorderRadius.circular(CustomBorderTheme.normalBorderRadius)),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
