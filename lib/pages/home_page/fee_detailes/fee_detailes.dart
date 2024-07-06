import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/model/DriverAppViolations/vehicle_violations.dart';
import 'package:flutter/material.dart';
import '../../../components/under_lined_text_button.dart';
import '../../../config/constant.dart';
import 'components/fee_detailes_head.dart';

class FeeDetailesPage extends StatefulWidget {
  const FeeDetailesPage({super.key});

  @override
  State<FeeDetailesPage> createState() => _FeeDetailesPageState();
}

class _FeeDetailesPageState extends State<FeeDetailesPage> {
  var feeNumber = 21;
  var feeReason = 'وقوف خارج الكراج';
  var carLetterType = 'ب';
  var carPlateType = 'أجرة';
  var carPlateNumber = '123456';
  var carState = 'ديالى';
  var privousFee = '50,000';
  var newFee = '100,00';
  //Assuming this is how we know if it was doubled cuz i dont have the api
  dynamic currentFee;
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Violation violation = data['violation'];
    bool isDoubled() {
      if (violation.amount != violation.totalAmount) {
        return true;
      }
      return false;
    }

    currentFee = isDoubled() ? newFee : privousFee;
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeeDetailesHead(
              debtStatementReceipt: violation,
            ),
            Gap(Insets.medium),
            Row(
              children: [
                CustomISvgStyle(icon: Assets.assetsIconsReceipt),
                Gap(Insets.small),
                Text(
                  'سبب المخالفة: لا يوجد.',
                  style: TextStyle(fontSize: CustomFontsTheme.mediumSize),
                )
              ],
            ),
            Gap(Insets.medium),
            CarInfo(
                carPlateNumber: violation.vehicleChassisNumber,
                carState: violation.vehicleGovernorateName ?? 'لا يوجد',
                carLetterType: violation.vehiclePlateCharacterName,
                carPlateType: violation.vehiclePlateType ?? 'لا يوجد'),
            Gap(Insets.medium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomISvgStyle(icon: Assets.assetsIconsCamera),
                    Gap(Insets.small),
                    Text(
                      'صورة المخالفة',
                      style: TextStyle(fontSize: CustomFontsTheme.mediumSize),
                    ),
                  ],
                ),
                UnderLinedTextBUtton(
                  text: 'عرض الصورة',
                  onTap: () => null,
                ),
              ],
            ),
            Gap(Insets.medium),
            Row(
              children: [
                CustomISvgStyle(icon: Assets.assetsIconsReceipt),
                Gap(Insets.small),
                Text(
                  'سبب موقع المخالفة: ${violation.amount}',
                  style: TextStyle(fontSize: CustomFontsTheme.mediumSize),
                ),
              ],
            ),
            Gap(Insets.medium),
            Container(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
                child: Image.network(
                    'https://scontent.fbgw62-1.fna.fbcdn.net/v/t1.18169-9/21463347_1699043643463793_8210583244583863516_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=7b2446&_nc_eui2=AeFRIiiIxf7qIe0WN2T42TXpvbJ4CCWEbvG9sngIJYRu8SuUoMyzeo04PhHFBwAozGPFW94RvH3geGvyYU1zjfXw&_nc_ohc=Bbasb7o9_DgQ7kNvgGat6aY&_nc_ht=scontent.fbgw62-1.fna&oh=00_AYDt1l-tbdPzxCRIxS39Mwdib4aFjUX2_67wMdeT9aW_EQ&oe=66A67E91'),
              ),
            ),
            Gap(Insets.small),
            Row(
              children: [
                CustomISvgStyle(icon: Assets.assetsIconsReceipt),
                Gap(Insets.small),
                Text(
                  'قيمة الغرامة',
                  style: TextStyle(fontSize: CustomFontsTheme.bigSize - 4),
                ),
                Gap(Insets.exSmall),
                Text(
                  ' ${addCommasToNumber(violation.amount)} د. ع',
                  style: TextStyle(
                      decorationColor: Theme.of(context).colorScheme.error,
                      decoration: isDoubled()
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: isDoubled()
                          ? CustomFontsTheme.smallSize
                          : CustomFontsTheme.bigSize - 4),
                ),
                Spacer(),
                if (isDoubled())
                  Text(
                    '${addCommasToNumber(violation.totalAmount)} د. ع.',
                    style: TextStyle(fontSize: CustomFontsTheme.bigSize - 4),
                  ),
              ],
            ),
            if (isDoubled())
              Text(
                '* تمت مضاعفة قيمة الغرامة لتأخرك شهر عن الدفع',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: CustomFontsTheme.smallSize,
                ),
              ),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: ElevatedButtonChild(
                    text: 'دفع الغرامة', icon: Assets.assetsIconsCard)),
            Gap(Insets.medium),
          ],
        ),
      ),
    );
  }
}

class CarInfo extends StatelessWidget {
  const CarInfo({
    super.key,
    required this.carPlateNumber,
    required this.carState,
    required this.carLetterType,
    required this.carPlateType,
  });

  final String carPlateNumber;
  final String carState;
  final String carLetterType;
  final String carPlateType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomISvgStyle(icon: Assets.assetsIconsCar),
            Gap(Insets.small),
            Text(
              'تفاصيل المركبة:',
              style: TextStyle(fontSize: CustomFontsTheme.mediumSize),
            )
          ],
        ),
        Gap(Insets.small),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رقم اللوحة: $carPlateNumber'),
                Text('المحافظة: $carState'),
              ],
            ),
            Gap(MediaQuery.of(context).size.width / 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('حرف اللوحة: $carLetterType'),
                Text('نوع اللوحة: $carPlateType')
              ],
            ),
          ],
        )
      ],
    );
  }
}
