import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../components/custom_svg_style.dart';
import '../../../../config/constant.dart';
import '../../../../controller/current_user_controller.dart';

class SignOutBottomSheet extends StatelessWidget {
  const SignOutBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put<UserController>(UserController());
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.onSecondary,
      child: Padding(
        padding: EdgeInsets.all(Insets.medium),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 8,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius)),
            ),
            Gap(Insets.medium),
            Text(
              'هل انت متأكد من ذلك ؟ ',
              style: TextStyle(fontSize: CustomFontsTheme.bigSize),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  final prefs = SharedPreferences.getInstance();
                  Get.offAllNamed(Routes.loginOrRigisterPage);
                  controller.removeUserFromPreferences();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Theme.of(context).colorScheme.error),
                child: Text('تسجيل الخروج')),
            TextButton(
                onPressed: () => Get.back(),
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: Text('لا')),
            Gap(Insets.medium),
          ],
        ),
      ),
    );
  }
}

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  bool themeChange = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CustomISvgStyle(icon: Assets.assetsIconsPaintRoller),
        title: Text('الثيم'),
        trailing: Switch(
            value: themeChange,
            onChanged: (value) {
              setState(() {
                if (value) {
                  Get.changeTheme(ThemeData.dark());
                  themeChange = value;
                } else {
                  Get.changeTheme(ThemeData.light());
                  themeChange = value;
                }
              });
            }));
  }
}
