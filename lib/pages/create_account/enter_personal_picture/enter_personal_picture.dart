import 'dart:async';

import 'package:Trip/config/constant.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_auth_steps_tracker.dart';
import '../../../components/custom_back_botton.dart';
import '../../../components/custom_shaking_button.dart';
import '../../../controller/create_onwer_controller.dart';
import 'components/personal_image_input.dart';

class EnterPersonalPicturePage extends StatefulWidget {
  const EnterPersonalPicturePage({Key? key}) : super(key: key);

  @override
  State<EnterPersonalPicturePage> createState() =>
      _EnterPersonalPicturePageState();
}

class _EnterPersonalPicturePageState extends State<EnterPersonalPicturePage> {
  final CreateOwnerController controller =
      Get.put<CreateOwnerController>(CreateOwnerController());
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool isOwner = data['isOwner'];
    Future<bool> checkValidation() async {
      controller.printVariables();
      setState(() {
        isValid = controller.personalPicture != null;
      });
      if (isValid) {
        /// await controller.register();
        if (isOwner) {
            Get.toNamed(Routes.createQrCodePage, arguments: {'isOwner': isOwner});
        } else {
          Get.toNamed(Routes.whereDoYouWantToWorkPage,
              arguments: {'isOwner': isOwner});
        }
      }
      return isValid;
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: CustomBackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.large),
        child: Column(
          children: [
            Text(
              'أضف صورة شخصية',
              style: TextStyle(
                fontSize: CustomFontsTheme.veryBigSize,
              ),
            ),
            SizedBox(height: Insets.small),
            CustomAuthStepsTracker(
                itemCount: isOwner ? 4 : 3, highlightIndex: isOwner ? 2 : 1),
            SizedBox(height: Insets.exLarge * 2),
            PersonalImageInput(
              onPickImage: (image) => controller.personalPicture = image,
            ),
            Spacer(),
            ShakeButton(
              text: 'التالي',
              icon: Icon(Icons.chevron_right_outlined),
              onPress: checkValidation,
              shaking: !isValid,
            ),
          ],
        ),
      ),
    );
  }
}
