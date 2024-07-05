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
  final String imageUrl;
  final String carPlateInfo;
  final String carType;
  final String expireDate;
  final String cardNumber;
  final String qrData;
  final int cardMoney;
  final String feesCardTitle;
  final String feesCardNumber;
  final String feesCardNumText;
  final String tripsCardTitle;
  final String tripsCardNumber;
  final String tripsCardNumText;
  final List<CustomListTile> moneyTransfersList;
  final List<TripCard> latestTripsList;

  const HomePageContent({
    super.key,
    required this.imageUrl,
    required this.carPlateInfo,
    required this.carType,
    required this.expireDate,
    required this.cardNumber,
    required this.qrData,
    required this.cardMoney,
    required this.feesCardTitle,
    required this.feesCardNumber,
    required this.feesCardNumText,
    required this.tripsCardTitle,
    required this.tripsCardNumber,
    required this.tripsCardNumText,
    required this.moneyTransfersList,
    required this.latestTripsList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          HomePageHead(imageUrl: imageUrl),
          Gap(Insets.medium),
          UserCard(
            carPlateInfo: carPlateInfo,
            carType: carType,
            expireDate: expireDate,
            cardNumber: cardNumber,
            qrData: qrData,
            cardMoney: cardMoney,
          ),
          Gap(Insets.small),
          Row(
            children: [
              MiniCard(
                cardTitle: feesCardTitle,
                cardNumber: feesCardNumber,
                cardNumText: feesCardNumText,
                decoration: SequaredPositionedContainers(),
                onIconPressed: () => Get.toNamed(Routes.feesOnCarPage),
              ),
              Gap(Insets.small),
              MiniCard(
                cardTitle: tripsCardTitle,
                cardNumber: tripsCardNumber,
                cardNumText: tripsCardNumText,
                decoration: CirculerPositionedContainers(),
                onIconPressed: () => Get.toNamed(Routes.tripsPage),
              ),
            ],
          ),
          Gap(Insets.small),
          HomePageBottomHalf(
            moneyTransfersList: moneyTransfersList,
            latestTripsList: latestTripsList,
          ),
        ],
      ),
    );
  }
}
