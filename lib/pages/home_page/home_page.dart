import 'dart:async';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import '../../components/custom_list_tile.dart';
import '../../components/trip_card.dart';
import '../../controller/current_user_controller.dart';
import '../../model/MobileHomes/vehicle_debt_statement.dart';
import '../../model/Profiles/profile.dart';
import '../../services/mobile_home/dio_home.dart';
import '../../services/mobile_home/dio_vehicle_debt_statement.dart';
import 'components/home_page_content.dart';
import 'components/home_page_skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController controller = Get.put<UserController>(UserController());
  bool dataLoaded = false;
  Future<Profile>? homeDetails;
  VehicleDebtStatement? vehicleDebtStatementDetails;

  Future<void> fetchData() async {
    setState(() {
      dataLoaded = false;
    });

    homeDetails = HomeService.homeGet();
    if (controller.currentuUser != null &&
        controller.currentuUser!.vehicle != null &&
        controller.currentuUser!.vehicle!.isNotEmpty) {
      vehicleDebtStatementDetails =
          await VehicleDebtStatementService.vehicleDebtStatementGet(
              controller.currentuUser!.vehicle!.first.id);
    }
    setState(() {
      dataLoaded = true;
    });
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: FutureBuilder(
          future: homeDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return HomePageSkeleton();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!dataLoaded) {
              return HomePageSkeleton();
            } else {
              var user = controller.currentuUser!;
              return HomePageContent(
                cardAvailable: user.driverCard != null,
                imageUrl: user.image ?? '',
                carPlateInfo:
                    '${user.vehicle?.first.plateNumber ?? ''} ${user.vehicle?.first.plateCharacterName ?? ''} / ${user.vehicle?.first.governorateName ?? ''}',
                carType: user.vehicle != null && user.vehicle!.isNotEmpty
                    ? user.vehicle![0].vehicleModelName ?? ''
                    : '',
                expireDate: user.driverCard?.expiredDate?.toString() ?? ' ',
                cardNumber: user.driverCard?.number?.toString() ?? '0',
                qrData: 'https://github.com/karamiq/Garage-App',
                cardMoney: user.driverCard?.balance ?? 0,
                feesCardTitle: 'الغرامات المالية',
                feesCardNumber:
                    vehicleDebtStatementDetails?.numberOfReceipt?.toString() ??
                        '0',
                feesCardNumText: 'غرامة مالية',
                tripsCardTitle: 'عدد الرحلات',
                tripsCardNumber: '50',
                tripsCardNumText: 'رحلة',
                moneyTransfersList: [
                  CustomListTile(
                    icon: Assets.assetsIconsRouting,
                    title: 'تم شحن البطاقة',
                    subtitle: '2023/2/24',
                    trailing2: '25,000 د. ع.',
                  ),
                ],
                latestTripsList: [
                  TripCard(
                    from: 'كراج العلاوي',
                    to: 'كراج ام قصر',
                    price: '6,500',
                  ),
                  
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
