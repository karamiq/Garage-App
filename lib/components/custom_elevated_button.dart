import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class ElevatedButtonChild extends StatelessWidget {
  const ElevatedButtonChild({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final dynamic icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Gap(Insets.small),
        if (icon is IconData)
          Icon(
            icon as IconData?,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        if (icon is String)
          SvgPicture.asset(
            icon as String,
            color: Theme.of(context).scaffoldBackgroundColor,
          )
      ],
    );
  }
}
