import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/user_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'components/container_stack_decoration.dart';
import 'components/home_page_bottom_falf.dart';
import 'components/home_page_head.dart';
import 'components/mini_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onIconPressed() {
      print('pressed');
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.large),
        child: Column(
          children: [
            HomePageHead(),
            Gap(Insets.medium),
            UserCard(
              carPlateInfo: '24214 أ / بغداد',
              carType: 'دوج جارجر',
              expireDate: ' 10/12/2025',
              cardNumber: '10023', 
              cardMoney: '125,000'),
            Gap(Insets.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MiniCard(
                    cardTitle: 'الغرامات المالية',
                    cardNumber: '20',
                    cardNumText: 'غرامة مالية',
                    decoration: SequaredPositionedContainers(),
                    onIconPressed: onIconPressed),
                MiniCard(
                    cardTitle: 'عدد الرحلات',
                    cardNumber: '50',
                    cardNumText: 'رحلة',
                    decoration: CirculerPositionedContainers(),
                    onIconPressed: onIconPressed),
              ],
            ),
            Gap(Insets.medium),
           HomePageBottomHalf(),
          ],
        ),
      ),
    );
  }
}