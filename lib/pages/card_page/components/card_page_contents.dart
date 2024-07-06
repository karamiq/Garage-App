import 'package:flutter/material.dart';
import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/pages/home_page/components/user_card.dart';
import 'package:Trip/components/viewed_item_title.dart';
import 'package:Trip/router/router.dart';
import 'package:Trip/config/constant.dart';
import 'package:get/get.dart';

import '../../home_page/components/home_page_head.dart';

class CardPageContents extends StatelessWidget {
  final String imageUrl;
  final String qrData;
  final String carPlateInfo;
  final String carType;
  final String expireDate;
  final String cardNumber;
  final int cardMoney;
  final bool buttonAppears;
  final String mainText;
  final String secondText;
  final List<Map<String, String>> transactions;

  const CardPageContents({
    super.key,
    required this.imageUrl,
    required this.qrData,
    required this.carPlateInfo,
    required this.carType,
    required this.expireDate,
    required this.cardNumber,
    required this.cardMoney,
    required this.buttonAppears,
    required this.mainText,
    required this.secondText,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePageHead(
          imageUrl: imageUrl,
        ),
        SizedBox(height: Insets.medium),
        UserCard(
          qrData: qrData,
          carPlateInfo: carPlateInfo,
          carType: carType,
          expireDate: expireDate,
          cardNumber: cardNumber,
          cardMoney: cardMoney,
          buttonAppears: buttonAppears,
        ),
        SizedBox(height: Insets.exLarge),
        ViewedItemsTitle(
          mainText: mainText,
          secontText: secondText,
          onTap: () => Get.toNamed(
            Routes.seeAllPage,
          ),
        ),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: Insets.medium),
          itemCount: transactions.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return CustomListTile(
              icon: Assets.assetsIconsCard,
              title: transaction['title']!,
              subtitle: transaction['date']!,
              trailing2: transaction['amount']!,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: Insets.small),
        ),
      ],
    );
  }
}
