import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class ViewedItemsTitle extends StatelessWidget {
  const ViewedItemsTitle({
    super.key,
    required this.mainText,
    this.secontText = '',
    this.onTap,
    this.secondTextPressable = true,
  });
  final String mainText;
  final dynamic secontText;
  final dynamic onTap;
  final bool secondTextPressable;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainText,
          style: const TextStyle(
            fontSize: CustomFontsTheme.bigSize,
          ),
        ),
        InkWell(
          onTap: onTap,
          borderRadius:
              BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
          child: Padding(
            padding: EdgeInsets.all(Insets.exSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  secontText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: CustomFontsTheme.smallSize,
                  ),
                ),
                Gap(Insets.exSmall),
                Container(
                  height: 1.5,
                  width: (secontText.length * 5.1), // Convert double to String
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
