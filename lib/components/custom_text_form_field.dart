import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.labelText,
       this.prefixIcon,
      required this.validator,
      this.isTextField = true,this.keyboardType=TextInputType.text});

  final TextEditingController controller;
  final bool isTextField;
  final String labelText;
  final String? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
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
    helperText: '',
    fillColor: Theme.of(context).scaffoldBackgroundColor,
    filled: true,
    labelText: labelText,
    errorText: showError ? errorText : null,
    labelStyle: TextStyle(
      color: Theme.of(context).hintColor.withAlpha(100),
    ),
    //floatingLabelStyle:TextStyle(color: Theme.of(context).colorScheme.primary),
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
        CoustomBorderTheme.normalBorderRaduis,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: CoustomBorderTheme.borderWidth,
        color: Theme.of(context).colorScheme.primary,
      ),
      borderRadius: BorderRadius.circular(
        CoustomBorderTheme.normalBorderRaduis,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
      ),
      borderRadius: BorderRadius.circular(
        CoustomBorderTheme.normalBorderRaduis,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
      ),
      borderRadius: BorderRadius.circular(
        CoustomBorderTheme.normalBorderRaduis,
      ),
    ),
  );
}
