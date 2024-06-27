import 'package:Trip/components/custom_auth_steps_tracker.dart';
import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_date_picker.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../config/constant.dart';
import '../../../controller/create_onwer_controller.dart';
import '../../components/custom_back_botton.dart';
import 'components/image_input.dart';

class EnterHolderOrOwnerInfoPage extends StatefulWidget {
  const EnterHolderOrOwnerInfoPage({super.key});

  @override
  State<EnterHolderOrOwnerInfoPage> createState() =>
      _EnterHolderOrOwnerInfoPageState();
}

class _EnterHolderOrOwnerInfoPageState
    extends State<EnterHolderOrOwnerInfoPage> {
  TextEditingController DatePicker = TextEditingController();
  String? message;
  final CreateOwnerController controller =
      Get.put<CreateOwnerController>(CreateOwnerController());
  String? storagingType;
  final _formKey = GlobalKey<FormState>();
  String? validator(String? query) {
    final isvalid = validateInfo(query: query);
    return isvalid;
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final isOwner = data['isOwner'];
    void nextPage() {
      controller.printValues();
      if (_formKey.currentState!.validate() &&
          controller.drivingLicensePicture != null) {
        if (isOwner) {
          Get.toNamed(Routes.ownerCarInfoPage, arguments: {'isOwner': isOwner});
        } else {
          Get.toNamed(Routes.enterPersonalPicturePage, arguments: {'isOwner': isOwner});
        }
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: CustomBackButton(),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: Insets.medium, vertical: Insets.large),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  isOwner ? 'أنشاء حساب مالك' : 'أنشاء حساب حائز',
                  style: TextStyle(
                    fontSize: CustomFontsTheme.veryBigSize,
                  ),
                ),
                CustomAuthStepsTracker(
                    itemCount: isOwner ? 4 : 3, highlightIndex: 0),
                Gap(Insets.medium * 2),
                CustomTextFormField(
                    validator: validator,
                    controller: controller.fullName,
                    labelText: 'الاسم الثلاثي',
                    prefixIcon: Assets.assetsIconsUser),
                Gap(Insets.small),
                CustomTextFormField(
                    validator: validator,
                    controller: controller.motherName,
                    labelText: 'أسم الأم',
                    prefixIcon: Assets.assetsIconsUser),
                Gap(Insets.small),
                CustomItemSelect(
                    validator: validator,
                    labelText: 'المحافظة',
                    controller: controller.state,
                    itemsList: iraqStates),
                Gap(Insets.small),
                CustomTextFormField(
                    validator: validator,
                    controller: controller.area,
                    labelText: 'المنطقة',
                    prefixIcon: Assets.assetsIconsMapPin),
                Gap(Insets.small),
                CustomTextFormField(
                    validator: validator,
                    controller: controller.idNumber,
                    labelText: 'رقم الهوية',
                    prefixIcon: Assets.assetsIconsBuilding),
                Gap(Insets.small),
                CustomTextFormField(
                    validator: validator,
                    controller: controller.issuer,
                    labelText: 'جهة الأصدار',
                    prefixIcon: Assets.assetsIconsCalendar),
                Gap(Insets.small),
                CustomDatePicker(
                  onSelect: (value) => controller.issuerDate.text = value,
                  labelText: 'تاريخ الاصدار',
                  controller: controller.issuerDate,
                  prefixIcon: Assets.assetsIconsCalendar,
                  validator: validator,
                ),
                Gap(Insets.small),
                ImageInput(
                  text: 'قم برفع صورة لأجازة السوق',
                  onPickImage: (image) =>
                      controller.drivingLicensePicture = image,
                ),
                Gap(Insets.medium),
                ElevatedButton(
                    onPressed: nextPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('التالي'),
                        Gap(Insets.small),
                        Icon(Icons.chevron_right_outlined),
                      ],
                    )),
              ],
            ),
          )),
    );
  }
}

List<String> iraqStates = [
  'بغداد',
  'الأنبار',
  'بابل',
  'بصرة',
  'دهوك',
  'القادسية',
  'ديالى',
  'ذي قار',
  'السليمانية',
  'كربلاء',
  'كركوك',
  'ميسان',
  'النجف',
  'نينوى',
  'واسط',
  'البصرة',
  'المثنى',
  'القادسية',
  'المثنى'
];