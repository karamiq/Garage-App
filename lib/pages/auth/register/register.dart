import 'package:Trip/components/custom_back_botton.dart';
import 'package:Trip/components/custom_text_form_field.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../config/constant.dart';
import '../../../controller/otp_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final OtpController otpController = Get.put<OtpController>(OtpController());

  String? validator(String? query) {
    return validatePhoneNumber(
        query: query,
        message: 'الرقم الذي قمت بأدخله خطأ ! يرجى التحقق منه',
        context: context);
  }

  void next() {
    if (_formKey.currentState!.validate()) {
      otpController.sendOtp();
      Get.toNamed(Routes.otpPage, arguments: {
        'isLogin': false,
      });
    }
  }

  @override
  void initState() {
    otpController.phoneNumber = TextEditingController(text: '077');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: CustomBackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.medium,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.assetsIconsCreateAccountPic),
              Text(
                'أنشاء حساب جديد',
                style: TextStyle(
                    fontSize: CustomFontsTheme.veryBigSize,
                    fontWeight: CustomFontsTheme.bigWeight),
              ),
              Gap(Insets.medium),
              CustomTextFormField(
                validator: validator,
                controller: otpController.phoneNumber,
                labelText: 'رقم الهاتف',
                prefixIcon: Assets.assetsIconsPhone,
              ),
              Gap(Insets.exLarge),
              ElevatedButton(
                  onPressed: next,
                  child: ElevatedButtonChild(
                    text: 'التالي',
                    icon: Icons.chevron_left,
                  )),
              Gap(Insets.small),
            ],
          ),
        ),
      ),
    );
  }
}
