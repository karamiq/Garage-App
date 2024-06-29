import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomISvgStyle extends StatelessWidget {
  CustomISvgStyle({
    super.key,
    required this.icon,
    this.color,
  });

  final String icon;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Insets.small),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
        color: color != null
            ? color!.withOpacity(0.2)
            : Theme.of(context).colorScheme.onInverseSurface,
      ),
      child: SvgPicture.asset(
        icon,
        color: color != null ? color : Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
