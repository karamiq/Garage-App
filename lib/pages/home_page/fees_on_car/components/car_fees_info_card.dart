import 'package:flutter/material.dart';

import '../../../../config/constant.dart';

class CarFeesInfoCard extends StatelessWidget {
  const CarFeesInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.onIconPressed,
  });

  final String title;
  final String subTitle;
  final String icon;
  final Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 160,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius:
              BorderRadius.circular(CustomBorderTheme.normalBorderRadius)),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: Insets.small,
            top: Insets.medium,
            right: Insets.small,
            left: Insets.small),
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
            Gap(Insets.small),
            Text(
              subTitle,
              style: TextStyle(
                fontWeight: CustomFontsTheme.bigWeight,
                fontSize: CustomFontsTheme.bigSize,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onIconPressed,
                  style: IconButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor),
                  icon: SvgPicture.asset(icon,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
