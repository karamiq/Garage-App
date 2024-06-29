import 'package:flutter/material.dart';
import '../../../../components/custom_svg_style.dart';

class CustomProfileOption extends StatelessWidget {
  CustomProfileOption(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      required this.onPressed});

  final String title;
  final String icon;
  Color? color;
  void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: CustomISvgStyle(
        icon: icon,
        color: color,
      ),
      title: Text(title),
      trailing: Icon(
        Icons.chevron_right,
        color: color != null ? color : Theme.of(context).colorScheme.primary,
        size: 30,
      ),
    );
  }
}
