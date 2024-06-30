import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_list_tile.dart';
import '../../../components/mini_card.dart';
import '../../../components/trip_card.dart';
import '../../../config/constant.dart';
import '../../../router/router.dart';
import '../../home_page/components/container_stack_decoration.dart';
import '../../home_page/components/home_page_bottom_falf.dart';
import '../../home_page/components/home_page_head.dart';
import '../../home_page/components/user_card.dart';

class SelectedCarInfoPage extends StatelessWidget {
  const SelectedCarInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.medium),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading:
                    CustomCirculerAvatar(path: Assets.assetsImagesAvatarImage),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomISvgStyle(icon: Assets.assetsIconsPhone),
                    Gap(Insets.small),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Gap(Insets.medium),
              UserCard(
                  carPlateInfo: '24214 أ / بغداد',
                  carType: 'دوج جارجر',
                  expireDate: ' 10/12/2025',
                  cardNumber: '10023',
                  qrData: 'https://github.com/karamiq/Garage-App',
                  cardMoney: 125000),
              Gap(Insets.small),
              Row(
                children: [
                  MiniCard(
                      cardTitle: 'الغرامات المالية',
                      cardNumber: '20',
                      cardNumText: 'غرامة مالية',
                      decoration: SequaredPositionedContainers(),
                      onIconPressed: () => Get.toNamed(Routes.feesOnCarPage)),
                  Gap(Insets.small),
                  MiniCard(
                      cardTitle: 'عدد الرحلات',
                      cardNumber: '50',
                      cardNumText: 'رحلة',
                      decoration: CirculerPositionedContainers(),
                      onIconPressed: () => Get.toNamed(Routes.tripsPage)),
                ],
              ),
              Gap(Insets.small),
              HomePageBottomHalf(
                moneyTransfersList: [
                  CustomListTile(
                      icon: Assets.assetsIconsRouting,
                      title: 'تم شحن البطاقة',
                      subtitle: '2023/2/24',
                      trailing2: '25,000 د. ع.')
                ],
                latestTripsList: [
                  TripCard(
                      from: 'كراج العلاوي', to: 'كراج ام قصر', price: '6,500'),
                ],
              )
            ],
          ),
        ));
  }
}
