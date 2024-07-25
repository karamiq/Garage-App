import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/router/router.dart';
import 'package:Trip/services/dio_govs&cities.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_auth_steps_tracker.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/custom_year_date_picker.dart';
import '../../../config/constant.dart';
import '../../../controller/create_onwer_controller.dart';
import '../../../services/dio_plate.dart';
import '../../../services/dio_vehicle.dart';
import '../enter_holder_or_owner_info_page/components/image_input.dart';

class OwnerCarInfoPage extends StatelessWidget {
  OwnerCarInfoPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CreateOwnerController controller =
      Get.put<CreateOwnerController>(CreateOwnerController());
  String? validator(String? query) {
    final isValid = validateInfo(query);
    return isValid;
  }

  bool valid = true;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool isOwner = data['isOwner'];

    void checkValidation() {
      controller.printVariables();
      if (!_formKey.currentState!.validate()) return;
      if (controller.carLicensePicture == null) return;
      if (controller.carPicture == null) return;

      if (isOwner) {
        Get.toNamed(Routes.enterPersonalPicturePage,
            arguments: {'isOwner': isOwner});
      } else {
        Get.toNamed(Routes.qrCodeGeneratorPage, arguments: {
          'text': 'اذهب الى الهيأة لأضافة السيارة',
          'qrData': "https://github.com/karamiq/Garage-App",
          'newCar': true,
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.large),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('معلومات السيارة',
                  style: TextStyle(fontSize: CustomFontsTheme.veryBigSize)),
              SizedBox(height: Insets.small),
              if (isOwner)
                CustomAuthStepsTracker(
                    itemCount: isOwner ? 4 : 3, highlightIndex: 1),
              SizedBox(height: Insets.medium * 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      keyboardType: TextInputType.number,
                      validator: validator,
                      controller: controller.carPlateNumber,
                      labelText: 'رقم اللوحة',
                      prefixIcon: Assets.assetsIconsCarNumber,
                    ),
                  ),
                  SizedBox(width: Insets.small),
                  Expanded(
                    child: CustomApiItemSelect(
                      onChanged: (selectedChar) async {
                        try {
                          controller.plateCharacterId?.text = selectedChar?.id;
                          dynamic ff = await GovsService.govGetById(
                              selectedChar.governorateId);
                          controller.carState.text = ff.name;
                          print(selectedChar);
                        } catch (e) {
                          print(selectedChar);
                        }
                      },
                      labelText: 'حرف اللوحة',
                      controller: controller.carPlateLetter,
                      itemListFuture:
                          PlateCharactersService.plateCharacterGetByGovId(
                              controller.carGovernorateId!.text),
                      validator: validator,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Insets.small),
              CustomApiItemSelect(
                labelText: 'المحافظة',
                controller: controller.carState,
                itemListFuture: GovsService.gov(),
                validator: validator,
                onChanged: (selectedState) async {
                  try {
                    controller.carGovernorateId?.text = selectedState?.id;
                    controller.carPlateLetter = TextEditingController();
                  } catch (e) {
                    print(selectedState);
                  }
                },
              ),
              SizedBox(height: Insets.small),
              CustomApiItemSelect(
                labelText: 'نوع اللوحة',
                controller: controller.carPlateType,
                itemListFuture: PlateTypeService.plateTypeGet(),
                validator: validator,
                onChanged: (p0) => controller.plateTypeId?.text = p0?.id,
              ),
              SizedBox(height: Insets.small),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                validator: validator,
                controller: controller.carShasyNumber,
                labelText: 'رقم الشاصي',
                prefixIcon: Assets.assetsIconsCarNumber,
              ),
              SizedBox(height: Insets.small),
              CustomApiItemSelect(
                labelText: 'نوع المركبة',
                controller: controller.carType,
                itemListFuture: VehicleService.vehicleTypeGet(),
                validator: validator,
                prefixIcon: Assets.assetsIconsCar,
                onChanged: (p0) => controller.vehicleTypeId?.text = p0?.id,
              ),
              SizedBox(height: Insets.small),
              CustomApiItemSelect(
                itemListFuture: VehicleService.vehicleModelGet(),
                validator: validator,
                controller: controller.carModel,
                labelText: 'موديل المركبة',
                prefixIcon: Assets.assetsIconsDocument,
                onChanged: (p0) => controller.vehicleModelId?.text = p0?.id,
              ),
              SizedBox(height: Insets.small),
              CustomYearDatePicker(
                validator: validator,
                labelText: 'سنة الصنع',
                controller: controller.carYear,
                prefixIcon: Assets.assetsIconsCalendar,
              ),
              SizedBox(height: Insets.small),
              CustomTextFormField(
                validator: validator,
                controller: controller.carColor,
                labelText: 'اللون',
                prefixIcon: Assets.assetsIconsPalette,
              ),
              SizedBox(height: Insets.small),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                validator: validator,
                controller: controller.carNumberOfSeats,
                labelText: 'عدد المقاعد',
                prefixIcon: Assets.assetsIconsAirlineSeatReclineExtra,
              ),
              SizedBox(height: Insets.small),
              ImageInput(
                text: 'قم برفع صورة لسنوية السيارة',
                onPickImage: (image) => controller.carLicensePicture = image,
              ),
              SizedBox(height: Insets.medium),
              ImageInput(
                text: 'قم برفع صورة لسيارتك',
                onPickImage: (image) => controller.carPicture = image,
              ),
              SizedBox(height: Insets.large),
              ElevatedButton(
                onPressed: checkValidation,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('التالي'),
                    SizedBox(width: Insets.small),
                    Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
