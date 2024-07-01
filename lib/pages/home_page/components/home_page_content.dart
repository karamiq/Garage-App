import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/container_stack_decoration.dart';
import 'package:Trip/pages/home_page/components/user_card.dart';
import '../../../components/custom_list_tile.dart';
import '../../../components/mini_card.dart';
import '../../../components/trip_card.dart';
import '../../../router/router.dart';
import 'home_page_bottom_falf.dart';
import 'home_page_head.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          HomePageHead(
            imageUrl: Assets.assetsImagesAvatarImage,
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
              TripCard(from: 'كراج العلاوي', to: 'كراج ام قصر', price: '6,500'),
            ],
          )
        ],
      ),
    );
  }
}
