
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../config/constant.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - Insets.exLarge,
      height: 50,
      child: ElevatedButton(
        onPressed: () => null,
        child: ElevatedButtonChild(
          icon: icon,
          text: text,
        ),
      ),
    );
  }
}
