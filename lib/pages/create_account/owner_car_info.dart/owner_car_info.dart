import 'package:Trip/components/custom_date_picker.dart';
import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_auth_steps_tracker.dart';
import '../../../components/custom_back_botton.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../config/constant.dart';
import '../../../controller/create_onwer_controller.dart';
import '../enter_holder_or_owner_info_page/components/image_input.dart';

class OwnerCarInfoPage extends StatefulWidget {
  const OwnerCarInfoPage({super.key});

  @override
  State<OwnerCarInfoPage> createState() => _OwnerCarInfoPageState();
}

class _OwnerCarInfoPageState extends State<OwnerCarInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CreateOwnerController controller =
      Get.put<CreateOwnerController>(CreateOwnerController());
  String? validator(String? query) {
    final isValid = validateInfo(query: query);
    return isValid;
  }
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool isOwner = data['isOwner'];
    void checkValidation() {
    setState(() => valid = true);
    if (!_formKey.currentState!.validate()) {
      valid = false;
    }
    if (controller.carPicture == null) {
      valid = false;
    }
    if (controller.carLicensePicture == null) {
      valid = false;
    }
    if (valid) {
      Get.toNamed(Routes.enterPersonalPicturePage, arguments: {'isOwner' : isOwner});
    } else {
      print('error');
    }
  }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth:100,
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
                'معلومات السيارة',
                style: TextStyle(
                  fontSize: CustomFontsTheme.veryBigSize,
                ),
              ),
              SizedBox(height: Insets.small),
              CustomAuthStepsTracker(itemCount: isOwner ? 4 : 3,highlightIndex: 1),
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
                    child: CustomItemSelect(
                      //onSelect: (value) =>
                          //controller.carPlateLetter.text = value,
                      labelText: 'حرف اللوحة',
                      controller: controller.carPlateLetter,
                      itemsList: iraqiPlateLetters,
                      validator: validator,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Insets.small),
              CustomItemSelect(
                //onSelect: (value) => controller.carState.text = value,
                labelText: 'المحافظة',
                controller: controller.carState,
                itemsList: iraqStates,
                validator: validator,
              ),
              SizedBox(height: Insets.small),
              CustomItemSelect(
                //onSelect: (value) => controller.carPlateType.text = value,
                labelText: 'نوع اللوحة',
                controller: controller.carPlateType,
                itemsList: carPlates,
                validator: validator,
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
              CustomTextFormField(
                validator: validator,
                controller: controller.carType,
                labelText: 'نوع المركبة',
                prefixIcon: Assets.assetsIconsCar,
              ),
              SizedBox(height: Insets.small),
              CustomTextFormField(
                validator: validator,
                controller: controller.carModel,
                labelText: 'موديل المركبة',
                prefixIcon: Assets.assetsIconsDocument,
              ),
              SizedBox(height: Insets.small),
              CustomDatePicker(
                validator: validator,
                onSelect:(value) => controller.carYear.text = value, 
                labelText: 'سنة الصنع', 
                controller: controller.carYear, 
                prefixIcon: Assets.assetsIconsCalendar),

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

List<String> carPlates = [
  'خصوصي',
  'حكومي',
  'دبلوماسي',
  'أجرة',
  'تجاري',
  'مؤقت',
];

List<String> iraqiPlateLetters = [
  'ب',
  'ت',
  'ث',
  'ج',
  'ح',
  'خ',
  'د',
  'ذ',
  'ر',
  'ز',
  'س',
  'ش',
  'ص',
  'ض',
  'ط',
  'ظ',
  'ع',
  'غ',
  'ف',
  'ق',
  'ك',
  'ل',
  'م',
  'ن',
  'ه',
  'و',
  'ي'
];
List<String> arabicCarModels = [
  'تويوتا كامري',
  'نيسان التيما',
  'هوندا أكورد',
  'مرسيدس بنز C-Class',
  'بي إم دبليو الفئة الثالثة',
  'أودي A4',
  'فورد موستانج',
  'كيا أوبتيما',
  'هيونداي سوناتا',
  'لكزس ES',
  'شفروليه ماليبو',
  'فولكس واجن باسات',
  'مازدا 6',
  'جينيسيس G70',
  'سوبارو ليجاسي',
  'جيب جراند شيروكي',
  'رينو تاليسمان',
  'فولفو S60',
  'بورشه باناميرا',
  'جاغوار XF',
];
List<String> arabicCarTypes = [
  'سيدان',
  'هاتشباك',
  'كوبيه',
  'كروس أوفر',
  'كروسوفر',
  'كوبيه كابريوليه',
  'كامباكت',
  'كاميونيت',
  'ميني فان',
  'فان',
  'جيب',
  'ستيشن واجون',
  'سبورت',
  'كابروليه',
  'أفانت',
  'بيك آب',
  'كارجو فان',
  'سوبر كار',
  'هاتشباك سبورت',
  'ميكرو كار',
];

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
