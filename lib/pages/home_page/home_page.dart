import 'dart:async';
import 'package:Trip/config/constant.dart';
import 'package:Trip/model/MobileHomes/last_trips.dart';
import 'package:Trip/services/mobile_home/dio_last_trips.dart';
import 'package:flutter/material.dart';
import '../../components/custom_list_tile.dart';
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
  Profile? profile;
  VehicleDebtStatement? vehicleDebtStatementDetails;
  LastTrips? lastTrips;

  Future<void> fetchData() async {
    await controller
        .loadUserFromPreferences(); // Load user data from preferences
    if (controller.currentuUser != null) {
      profile = await ProfileService.profileGet();
      lastTrips = await lastTripsService
          .lastTripsGet(controller.currentuUser!.vehicle!.first.id);
      vehicleDebtStatementDetails =
          await VehicleDebtStatementService.vehicleDebtStatementGet(
              controller.currentuUser!.vehicle!.first.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return HomePageSkeleton();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (controller.currentuUser == null) {
              return Center(child: Text('No user data available.'));
            } else {
              return HomePageContent(
                cardAvailable: controller.currentuUser!.driverCard != null,
                imageUrl: controller.currentuUser!.image ?? '',
                carPlateInfo:
                    '${controller.currentuUser!.vehicle?.first.plateNumber ?? ''} ${controller.currentuUser!.vehicle?.first.plateCharacterName ?? ''} / ${controller.currentuUser!.vehicle?.first.governorateName ?? ''}',
                carType: controller.currentuUser!.vehicle != null &&
                        controller.currentuUser!.vehicle!.isNotEmpty
                    ? controller.currentuUser!.vehicle![0].vehicleModelName
                    : '',
                expireDate: controller.currentuUser!.driverCard?.expiredDate
                        .toString() ??
                    ' ',
                cardNumber:
                    controller.currentuUser!.driverCard?.number.toString() ??
                        '0',
                qrData: 'https://github.com/karamiq/Garage-App',
                cardMoney: controller.currentuUser!.driverCard?.balance ?? 0,
                feesCardTitle: 'الغرامات المالية',
                feesCardNumber:
                    vehicleDebtStatementDetails?.numberOfReceipt.toString() ??
                        '0',
                feesCardNumText: 'غرامة مالية',
                tripsCardTitle: 'عدد الرحلات',
                tripsCardNumber: lastTrips!.totalTripNumber.toString(),
                tripsCardNumText: 'رحلة',
                moneyTransfersList: [
                  CustomListTile(
                    icon: Assets.assetsIconsRouting,
                    title: 'تم شحن البطاقة',
                    subtitle: '2023/2/24',
                    trailing2: '25,000 د. ع.',
                  ),
                ],
                latestTripsList: lastTrips!.tripHistory,
              );
            }
          },
        ),
      ),
    );
  }
}
