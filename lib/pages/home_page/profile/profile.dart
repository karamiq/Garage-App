import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_app_bar.dart';
import '../../../config/constant.dart';
import 'components/custom_profile_option.dart';
import 'components/profile_card.dart';
import 'components/sign_out_bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  String language = '';
  @override
  Widget build(BuildContext context) {
    void onPressed() {
      print('ffffff');
    }

    String type = 'fff';

    return Scaffold(
      appBar: CustomAppBar(
        title: 'الحساب الشخصي',
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(
                userName: 'محمد علي محمد',
                expireDate: ' 10/12/2025',
                cardNumber: '10023',
                cardMoney: '125,000'),
            Gap(Insets.medium * 2.5),
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.onSecondary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomProfileOption(
                      onPressed: () => Get.toNamed(Routes.profilePage +
                          Routes.financialTranscationsPage),
                      title: 'العمليات المالية',
                      icon: Assets.assetsIconsMoney),
                  CustomProfileOption(
                      onPressed: () => customBottomSheet(
                            height: 300,
                            child: ChangeLanguageBottomSheet(),
                            context,
                          ),
                      title: 'اللغة',
                      icon: Assets.assetsIconsGlobe),
                  ChangeThemeButton(),
                  CustomProfileOption(
                      onPressed: () => Get.toNamed(
                              Routes.feesOnCarPage + Routes.sendingComplainPage,
                              arguments: {
                                'isFromProfile': true,
                                'id': '',
                                'fee': '',
                                'feeReason': '',
                                'feeDate': '',
                                'feeNumber': '',
                              }),
                      title: 'تقديم شكوى',
                      icon: Assets.assetsIconsReceipt),
                  CustomProfileOption(
                      onPressed: () => Get.toNamed(
                          Routes.profilePage + Routes.garageRatingPage),
                      title: 'تقييم الكراج',
                      icon: Assets.assetsIconsStar),
                ],
              ),
            ),
            Spacer(),
            Card(
              semanticContainer: false,
              elevation: 0,
              color: Theme.of(context).colorScheme.onSecondary,
              child: CustomProfileOption(
                onPressed: () => customBottomSheet(
                  height: 280,
                  child: SignOutBottomSheet(),
                  context,
                ),
                title: 'تسجيل الخروج',
                icon: Assets.assetsIconsStar,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            Gap(Insets.medium),
          ],
        ),
      ),
    );
  }
}

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({
    super.key,
  });
  //final String text;
  @override
  Widget build(BuildContext context) {
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
              'اللغة',
              style: TextStyle(fontSize: CustomFontsTheme.bigSize),
            ),
            Gap(Insets.large),
            CustomLanguageButton(
              text: 'العربية',
              languageCode: 'ar',
              onTap: () {},
            ),
            CustomLanguageButton(
              text: 'English',
              languageCode: 'en',
              onTap: () {},
            ),
            CustomLanguageButton(
              text: 'كوردى',
              languageCode: 'ku',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLanguageButton extends StatelessWidget {
  const CustomLanguageButton({
    super.key,
    required this.text,
    required this.languageCode,
    required this.onTap,
  });
  final String text;
  final String languageCode;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
      child: Card(
        elevation: 0,
        color: Get.locale!.countryCode == languageCode
            ? Theme.of(context).colorScheme.onSecondary
            : Theme.of(context).colorScheme.primary,
        child: Ink(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Insets.small, horizontal: Insets.exLarge * 3),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
