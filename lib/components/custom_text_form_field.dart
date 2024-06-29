import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/utils/const_class.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.prefixIcon,
      required this.validator,
      this.isTextField = true,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.maxLines});

  final TextEditingController controller;
  final bool isTextField;
  final String labelText;
  final String? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end, // Align text to the right
      textAlignVertical: TextAlignVertical.top, //
      keyboardType: keyboardType,
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      decoration: CustomInputDecoration(
          isTextField: isTextField,
          labelText: labelText,
          prefixIcon: prefixIcon,
          context: context),
      validator: validator,
    );
  }
}

InputDecoration CustomInputDecoration({
  bool isTextField = true,
  required String labelText,
  required String? prefixIcon,
  required BuildContext context,
  String? errorText,
}) {
  bool showError = errorText != null && errorText.isNotEmpty;

  return InputDecoration(
    floatingLabelStyle: TextStyle(
      color: Theme.of(context).colorScheme.primary,
    ),
    helperText: '',
    fillColor: Theme.of(context).scaffoldBackgroundColor,
    filled: true,
    labelText: labelText,
    errorText: showError ? errorText : null,
    labelStyle: TextStyle(
      color: Theme.of(context).hintColor.withAlpha(100),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    prefixIcon: prefixIcon == null
        ? null
        : Padding(
            padding: EdgeInsets.all(Insets.small * 1.2),
            child: SvgPicture.asset(
              prefixIcon,
              color: Theme.of(context).hintColor.withAlpha(100),
            ),
          ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).hintColor.withAlpha(100),
      ),
      borderRadius: BorderRadius.circular(
        CustomBorderTheme.normalBorderRadius,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: CustomBorderTheme.borderWidth,
        color: Theme.of(context).colorScheme.primary,
      ),
      borderRadius: BorderRadius.circular(
        CustomBorderTheme.normalBorderRadius,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
      ),
      borderRadius: BorderRadius.circular(
        CustomBorderTheme.normalBorderRadius,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
      ),
      borderRadius: BorderRadius.circular(
        CustomBorderTheme.normalBorderRadius,
      ),
    ),
  );
}
