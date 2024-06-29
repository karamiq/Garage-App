import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class FinancialTranscationsPage extends StatefulWidget {
  const FinancialTranscationsPage({super.key});

  @override
  State<FinancialTranscationsPage> createState() =>
      _FinancialTranscationsPageState();
}

class _FinancialTranscationsPageState extends State<FinancialTranscationsPage> {
  List data = [
    CustomListTile(
        icon: Assets.assetsIconsCardCharge,
        title: 'شحن البطاقة ',
        subtitle: 'تم شحن البطاقة الشخصية بمقدار 25,000 د. ع.',
        trailing2: '2024/1/31'),
    CustomListTile(
        icon: Assets.assetsIconsTicket,
        title: 'عملية تحويل ',
        subtitle: 'قمت بتحويلها الى حسين علي  ',
        trailing2: '15,000 د. ع.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'العمليات المالية',
        ),
        body: data.isEmpty
            ? Center(
                child: Text(
                  'الصفحة فارغة',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: CustomFontsTheme.veryBigSize),
                ),
              )
            : ListView.separated(
                padding: EdgeInsets.all(Insets.medium),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) => data[index],
                separatorBuilder: (context, index) => Gap(Insets.small),
              ));
  }
}
