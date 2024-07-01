import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/router/router.dart';
import 'package:Trip/components/custom_text_form_field.dart';
import 'package:Trip/controller/otp_controller.dart';

class LoginOrRigisterPage extends StatefulWidget {
  const LoginOrRigisterPage({super.key});

  @override
  State<LoginOrRigisterPage> createState() => _LoginOrRigisterPageState();
}

class _LoginOrRigisterPageState extends State<LoginOrRigisterPage> {
  final _formKey = GlobalKey<FormState>();
  final OtpController otpController = Get.put<OtpController>(OtpController());

  void signIn() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(Routes.otpPage, arguments: {
        'phoneNumber': otpController.phoneNumber.text,
        'isLogin': true,
      });
    }
  }

  @override
  void initState() {
    otpController.phoneNumber = TextEditingController(text: '077');
    super.initState();
  }

  String? validator(String? query) {
    return validatePhoneNumber(
      query: query,
      message: 'الرقم الذي قمت بأدخله خطأ ! يرجى التحقق منه',
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.medium,
          vertical: Insets.large,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.assetsIconsLoginOrRigisterPic),
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontSize: CustomFontsTheme.veryBigSize,
                  fontWeight: CustomFontsTheme.bigWeight,
                ),
              ),
              Gap(Insets.medium),
              CustomTextFormField(
                validator: validator,
                controller: otpController.phoneNumber,
                labelText: 'رقم الهاتف',
                prefixIcon: Assets.assetsIconsCustomPhone,
              ),
              Gap(Insets.medium),
              Gap(Insets.exLarge),
              ElevatedButton(onPressed: signIn, child: Text('تسجيل الدخول')),
              Gap(Insets.small),
              OutlinedButton(
                onPressed: () => Get.toNamed(Routes.registerPage),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Text('انشاء حساب جديد'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
