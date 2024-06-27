import 'package:Trip/config/constant.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_text_form_field.dart';

class LoginOrRigisterPage extends StatefulWidget {
  const LoginOrRigisterPage({super.key});

  @override
  State<LoginOrRigisterPage> createState() => _LoginOrRigisterPageState();
}

class _LoginOrRigisterPageState extends State<LoginOrRigisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();

  void signIn() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed(Routes.otpPage,
          arguments: {'phoneNumber': phoneNumberController.text,'isLogin': true,});
    }
  }

  @override
  void initState() {
    phoneNumberController = TextEditingController(text: '077');
    super.initState();
  }

  String? validator(String? query) {
    return validatePhoneNumber(
        query: query,
        message: 'الرقم الذي قمت بأدخله خطأ ! يرجى التحقق منه',
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.large),
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
                    fontWeight: CustomFontsTheme.bigWeight),
              ),
              Gap(Insets.medium),
              CustomTextFormField(
                validator: validator,
                controller: phoneNumberController,
                labelText: 'رقم الهاتف',
                prefixIcon:Assets.assetsIconsCustomPhone,
              ),
              Gap(Insets.medium),
              //CustomTextFormField(
              //  validator: validator,
              //  controller: phoneNumberController,
              //  labelText: 'رقم الهاتف',
              //  prefixIcon: SvgPicture.asset(
              //    Assets.assetsIconsCustomPhone,
              //    color: Theme.of(context).hintColor.withAlpha(100),
              //  ),
              //),
              Gap(Insets.exLarge),
              ElevatedButton(onPressed: signIn, child: Text('تسجيل الدخول')),
              Gap(Insets.small),
              OutlinedButton(
                  onPressed: ()=>Get.toNamed(Routes.registerPage),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onSurface
                      // minimumSize: const Size(double.infinity, 50),
                      ),
                  child: Text('انشاء حساب جديد'))
            ],
          ),
        ),
      ),
    );
  }
}
