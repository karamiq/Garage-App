import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/pages/create_account/enter_holder_or_owner_info_page/enter_holder_or_owner_info_page.dart';
import 'package:Trip/router/router.dart';
import 'package:Trip/services/dio_garages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_back_botton.dart';
import '../../../config/utils/const_class.dart';
import '../../../config/utils/functions.dart';
import '../../../controller/create_onwer_controller.dart';
import '../../../services/dio_govs&cities.dart';

class WhereDoYouWantToWorkPage extends StatelessWidget {
  const WhereDoYouWantToWorkPage({super.key});

  String? validator(String? query) {
    final isValid = validateInfo(query);
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    final CreateOwnerController controller =
        Get.put<CreateOwnerController>(CreateOwnerController());
    final _formKey = GlobalKey<FormState>();
    // final data =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // bool isOwner = data['isOwner'];
    void checkValidation() {
      if (_formKey.currentState!.validate()) {
        Get.toNamed(Routes.createQrCodePage, arguments: {'isOwner': false});
      }
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'أين تريد العمل',
                style: TextStyle(
                  fontSize: CustomFontsTheme.veryBigSize,
                ),
              ),
              SizedBox(height: Insets.exLarge * 1.5),
              CustomItemSelect(
                  labelText: 'المحافظة',
                  controller: controller.holderStateWork,
                  itemListFuture: GovsService.gov(),
                  validator: validator),
              SizedBox(height: Insets.small),
              CustomItemSelect(
                  labelText: 'الكراج',
                  controller: controller.holderGarageWork,
                  itemListFuture: GaragesSrvce.garagesGet(),
                  validator: validator),
              Spacer(),
              ElevatedButton(
                onPressed: checkValidation,
                child: Text('أرسل طلب'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
