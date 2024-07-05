import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../components/custom_back_botton.dart';
import '../../../config/utils/const_class.dart';
import '../../../controller/otp_controller.dart';
import '../../../router/router.dart';

class OtpPage extends StatefulWidget {
  OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final OtpController otpController = Get.put<OtpController>(OtpController());
  final _formKey = GlobalKey<FormState>();
  bool buttonEnabled = false;
  int _countdown = 0;
  late Timer _timer;

  void startCountdown() {
    setState(() {
      otpController.otpCode.text = '';
      buttonEnabled = false;
      _countdown = 60;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
          } else {
            buttonEnabled = true;
            _timer.cancel();
          }
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final isLogin = data['isLogin'];

    void confirm() async {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      await otpController.verifyOtp();
      if (isLogin) {
        Get.toNamed(Routes.tapsPage);
      } else {
        Get.toNamed(Routes.createAccountType);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: CustomBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'تأكيد الحساب',
                style: TextStyle(
                  fontSize: CustomFontsTheme.veryBigSize,
                  fontWeight: CustomFontsTheme.mediumWeight,
                ),
              ),
              SizedBox(height: Insets.large),
              Text(
                (otpController.phoneNumber.text.substring(1) + ' 964+'),
                style: TextStyle(
                  fontSize: CustomFontsTheme.mediumSize * 2,
                ),
              ),
              Text(
                'ادخل الرقم السري الذي تم ارساله على الرقم\n الخاص بك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: CustomFontsTheme.mediumSize,
                ),
              ),
              SizedBox(height: Insets.exLarge),
              Pinput(
                length: 6,
                validator: otpController.validator,
                controller: otpController.otpCode,
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius,
                    ),
                  ),
                ),
                errorPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: .5,
                            color: Theme.of(context).colorScheme.error),
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(
                            CustomBorderTheme.normalBorderRadius))),
                defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(
                            CustomBorderTheme.normalBorderRadius))),
              ),
              SizedBox(height: Insets.large),
              Text(
                _formatTime(_countdown),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: CustomFontsTheme.veryBigSize,
                ),
              ),
              SizedBox(height: Insets.large),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'لم يصلك رمز التأكيد؟',
                    style: TextStyle(
                      color: buttonEnabled
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      fontSize: CustomFontsTheme.mediumSize,
                    ),
                  ),
                  TextButton(
                    onPressed: buttonEnabled ? startCountdown : null,
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColorDark,
                      minimumSize: Size(40, 40),
                    ),
                    child: Text('اعادة ارسال'),
                  ),
                ],
              ),
              SizedBox(height: Insets.small),
              ElevatedButton(
                onPressed: otpController.otpCode.text.isEmpty || otpController.isLoading
                    ? null
                    : (!buttonEnabled ? confirm : null),
                child: otpController.isLoading
                    ? CircularProgressIndicator()
                    : Text('تأكيد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Pinput(
                length: 6,
                validator: otpController.validator,
                controller: otpController.otpCode,
                focusedPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(
                            CustomBorderTheme.normalBorderRadius))),
                errorPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: .5,
                            color: Theme.of(context).colorScheme.error),
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(
                            CustomBorderTheme.normalBorderRadius))),
                defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        borderRadius: BorderRadius.circular(
                            CustomBorderTheme.normalBorderRadius))),
              ),
*/