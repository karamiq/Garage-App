import 'package:Trip/config/utils/const_class.dart';
import 'package:flutter/material.dart';

import '../../../config/constant.dart';

class TripsSequaredInfoCard extends StatelessWidget {
  const TripsSequaredInfoCard({
    super.key,
    required this.title,
    required this.count,
    required this.type,
    required this.iconType,
    required this.percentage,
  });

  final String title;
  final String count;
  final String type;
  final IconData iconType;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 165,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius:
              BorderRadius.circular(CustomBorderTheme.normalBorderRadius)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Insets.medium, horizontal: Insets.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: CustomFontsTheme.mediumSize,
              ),
            ),
            Text(
              count,
              style: TextStyle(
                fontWeight: CustomFontsTheme.bigWeight,
                fontSize: CustomFontsTheme.veryBigSize,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Gap(1),
                Icon(
                  iconType,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Gap(1),
                Text(
                  '$percentage%',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: CustomFontsTheme.mediumSize),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
