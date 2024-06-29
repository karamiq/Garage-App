import 'package:flutter/material.dart';

import '../config/constant.dart';
import 'custom_svg_style.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing2,
    this.trailing1 = null,
  });

  final String icon;
  final String title;
  final String subtitle;
  final String trailing2;

  final String? trailing1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius:
              BorderRadius.circular(CustomBorderTheme.normalBorderRadius)),
      child: ListTile(
        leading: CustomISvgStyle(icon: icon),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: CustomFontsTheme.smallSize,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (trailing1 != null)
              Text(
                trailing1!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: CustomFontsTheme.smallSize,
                ),
              ),
            Text(
              trailing2,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: CustomFontsTheme.normalSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
