import 'package:Trip/config/constant.dart';
import 'package:Trip/components/trip_card.dart';
import 'package:Trip/pages/home_page/components/user_card.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import '../../components/custom_list_tile.dart';
import 'components/container_stack_decoration.dart';
import 'components/home_page_bottom_falf.dart';
import 'components/home_page_head.dart';
import '../../components/mini_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.medium),
      child: Column(
        children: [
          HomePageHead(
            imageUrl: Assets.assetsImagesAvatarImage,
          ),
          Gap(Insets.medium),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              UserCard(
                  carPlateInfo: '24214 أ / بغداد',
                  carType: 'دوج جارجر',
                  expireDate: ' 10/12/2025',
                  cardNumber: '10023',
                  qrData: 'https://github.com/karamiq/Garage-App',
                  cardMoney: 125000),
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () => Get.toNamed(Routes.profilePage),
                  style: IconButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor:
                          Theme.of(context).scaffoldBackgroundColor),
                  icon: Transform.rotate(
                    angle: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.chevron_right,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              TripCard(from: 'كراج العلاوي', to: 'كراج ام قصر', price: '6,500'),
            ],
          )
        ],
      ),
    ));
  }
}
