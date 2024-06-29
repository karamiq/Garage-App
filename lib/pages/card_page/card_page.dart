import 'package:Trip/components/viewed_item_title.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_list_tile.dart';
import '../../config/constant.dart';
import '../home_page/components/home_page_head.dart';
import '../home_page/components/user_card.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.medium,
            ),
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
                  buttonAppears: false,
                ),
                Gap(Insets.exLarge),
                ViewedItemsTitle(
                    mainText: 'أخر التحويلات المالية',
                    secontText: 'رؤية الجميع',
                    onTap: () => Get.toNamed(
                          Routes.seeAllPage,
                        )),
                ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: Insets.medium),
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CustomListTile(
                      icon: Assets.assetsIconsCard,
                      title: 'تم شحن البطاقة',
                      subtitle: '2023/2/24',
                      trailing2: '25,000 د. ع.'),
                  separatorBuilder: (context, index) => Gap(Insets.small),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: ElevatedButton(
                      onPressed: () {},
                      child: ElevatedButtonChild(
                        text: 'تعبئة البطاقة ',
                        icon: Assets.assetsIconsCard,
                      )),
                )
              ],
            )));
  }
}
