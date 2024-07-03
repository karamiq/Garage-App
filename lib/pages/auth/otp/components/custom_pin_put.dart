import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../config/constant.dart';
import '../../../../controller/otp_controller.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.otpController,
  });

  final OtpController otpController;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      validator: otpController.validator,
      controller: otpController.otpCode,
      focusedPinTheme: PinTheme(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              color: Theme.of(context).colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(CustomBorderTheme.normalBorderRadius))),
      errorPinTheme: PinTheme(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(
                  width: .5, color: Theme.of(context).colorScheme.error),
              color: Theme.of(context).colorScheme.onInverseSurface,
              borderRadius:
                  BorderRadius.circular(CustomBorderTheme.normalBorderRadius))),
      defaultPinTheme: PinTheme(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onInverseSurface,
              borderRadius:
                  BorderRadius.circular(CustomBorderTheme.normalBorderRadius))),
    );
  }
}
