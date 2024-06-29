import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/config/utils/const_class.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/constant.dart';
import 'components/trip_detailes_head.dart';

class TripDetailesPage extends StatefulWidget {
  const TripDetailesPage({super.key});

  @override
  State<TripDetailesPage> createState() => _TripDetailesPageState();
}

class _TripDetailesPageState extends State<TripDetailesPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
  }

  void fetchData() async {}

  @override
  Widget build(BuildContext context) {
    var from = 'كراج العلاوي';
    var to = 'كراج ام قصر';

    void fetchData() {}
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = data['id'];
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'رحلة 1#',
                  style: TextStyle(
                    fontSize: CustomFontsTheme.bigSize,
                  ),
                ),
                Gap(Insets.exSmall),
                Text(
                  '2024 / 2 / 1',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Gap(Insets.medium),
            TripDetailesHead(from: from, to: to),
            Gap(Insets.exLarge),
            Container(
              padding: EdgeInsets.all(Insets.small),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'معلومات الرحلة',
                      style: TextStyle(
                        fontSize: CustomFontsTheme.bigSize,
                      ),
                    ),
                    Gap(Insets.medium),
                    TripDetailesInfoRow(
                        icon: Assets.assetsIconsSignOut,
                        text: 'وقت الخروج',
                        value: DateFormat('h:mm a').format(DateTime.now())),
                    TripDetailesInfoRow(
                        icon: Assets.assetsIconsSignIn,
                        text: 'وقت الدخول',
                        value: DateFormat('h:mm a').format(DateTime.now())),
                    TripDetailesInfoRow(
                        icon: Assets.assetsIconsTimer,
                        text: 'مدة الرحلة',
                        value: '5 ساعات و 7 دقائق '),
                  ]),
            ),
            Gap(Insets.exLarge),
            Container(
              padding: EdgeInsets.all(Insets.small),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الأستقطاعات المالية',
                    style: TextStyle(
                      fontSize: CustomFontsTheme.bigSize,
                    ),
                  ),
                  Gap(Insets.medium),
                  TripDetailesInfoRow(
                      icon: Assets.assetsIconsReceipt,
                      text: 'المنفست',
                      value: '2,000 د. ع.'),
                  TripDetailesInfoRow(
                      icon: Assets.assetsIconsMoon,
                      text: 'المبيت',
                      value: '1,000 د. ع.'),
                  TripDetailesInfoRow(
                      icon: Assets.assetsIconsReceipt2,
                      text: 'الطابور',
                      value: '1,000 د. ع.'),
                  TripDetailesInfoRow(
                      icon: Assets.assetsIconsTicket,
                      text: 'الجباية',
                      value: '1,000 د. ع.'),
                  Divider(),
                  TripDetailesInfoRow(
                      icon: Assets.assetsIconsMoney,
                      text: 'السعر الكلي',
                      value: '1,000 د. ع.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripDetailesInfoRow extends StatelessWidget {
  const TripDetailesInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  final String icon;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.exSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(Insets.exSmall * 1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius),
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
                child: SvgPicture.asset(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(Insets.exSmall),
              Text(
                text,
                style: TextStyle(fontSize: CustomFontsTheme.mediumSize),
              )
            ],
          ),
          Text(value)
        ],
      ),
    );
  }
}
