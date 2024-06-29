import 'package:flutter/material.dart';

import '../config/constant.dart';

class UnderLinedTextBUtton extends StatelessWidget {
  const UnderLinedTextBUtton(
      {super.key, required this.text, required this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Insets.exSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                fontSize: CustomFontsTheme.smallSize,
              ),
            ),
            Gap(Insets.exSmall),
            Container(
              height: 1.5,
              width: (text.length * 7.1), // Convert double to String
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            ),
          ],
        ),
      ),
    );
  }
}
