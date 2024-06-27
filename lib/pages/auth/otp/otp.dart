import 'dart:async';

import 'package:Trip/components/custom_back_botton.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final pinController = TextEditingController();
  bool buttomEnabled = false;
  int _countdown = 0;

  late Timer _timer;

  void startCountdown() {
    setState(() {
      pinController.text = '';
      buttomEnabled = false;
      _countdown = 60;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_countdown > 0) {
            _countdown--;
          } else {
            buttomEnabled = true;
            _timer.cancel(); // Stop the timer
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
  void dispose() {
    pinController.dispose();
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final phoneNumber = data['phoneNumber'];
    final isLogin = data['isLogin'];
    void confirm() {
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
        child: Column(
          children: [
            Text(
              'تأكيد الحساب',
              style: TextStyle(
                  fontSize: CustomFontsTheme.veryBigSize,
                  fontWeight: CustomFontsTheme.mediumWeight),
            ),
            Gap(Insets.large),
            Text(
              (phoneNumber!.substring(1) + ' 964+'),
              style: TextStyle(
                fontSize: CustomFontsTheme.mediumSize * 2,
              ),
            ),
            Text('ادخل الرقم السري الذي تم ارساله على الرقم\n الخاص بك',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: CustomFontsTheme.mediumSize)),
            Gap(Insets.exLarge),
            Pinput(
              length: 5,
              controller: pinController,
            ),
            Gap(Insets.large),
            Text(
              _formatTime(_countdown),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: CustomFontsTheme.veryBigSize),
            ),
            Gap(Insets.large),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لم يصلك رمز التأكيد؟',
                  style: TextStyle(
                    color: buttomEnabled
                        ? Theme.of(context).colorScheme.secondary
                        : null,
                    fontSize: CustomFontsTheme.mediumSize,
                  ),
                ),
                TextButton(
                    onPressed: buttomEnabled ? startCountdown : null,
                    style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).primaryColorDark,
                        minimumSize: Size(40, 40)),
                    child: Text('اعادة ارسال')),
              ],
            ),
            Gap(Insets.small),
            ElevatedButton(
                onPressed: pinController.text.isEmpty
                    ? null
                    : (!buttomEnabled ? confirm : null),
                child: Text(
                  'تأكيد',
                ))
          ],
        ),
      ),
    );
  }
}
