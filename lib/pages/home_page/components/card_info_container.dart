
import 'package:flutter/material.dart';

import '../../../config/utils/const_class.dart';

class CardInfoContainer extends StatelessWidget {
  const CardInfoContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Insets.small, vertical: Insets.exSmall),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius:
              BorderRadius.circular(CoustomBorderTheme.normalBorderRaduis)),
      child: Text(text),
    );
  }
}
