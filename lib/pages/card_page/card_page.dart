import 'package:Trip/components/subtitle.dart';
import 'package:Trip/components/viewed_item_title.dart';
import 'package:flutter/material.dart';

import '../../config/constant.dart';
import '../home_page/components/home_page_head.dart';
import '../home_page/components/user_card.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: Insets.medium, vertical: Insets.large),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomePageHead(),
                Gap(Insets.medium),
                UserCard(
                    carPlateInfo: '24214 أ / بغداد',
                    carType: 'دوج جارجر',
                    expireDate: ' 10/12/2025',
                    cardNumber: '10023',
                    cardMoney: '125,000',
                    buttonAppears: false,),
                Gap(Insets.small),
                ViewedItemsTitle(
                  mainText: 'أخر التحويلات المالية', 
                  secontText: 'رؤية الجميع',
                  onTap: (){},),
                //SubTitle(ttt: 'رؤية الجميع')
              ],
            )));
  }
}
