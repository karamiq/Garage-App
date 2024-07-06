import 'package:flutter/material.dart';
import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_floating_action_button.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/controller/current_user_controller.dart';
import 'package:Trip/model/MobileHomes/vehicle_debt_statement.dart';
import 'package:Trip/services/mobile_home/dio_vehicle_debt_statement.dart';
import 'package:Trip/router/router.dart';
import 'package:Trip/components/shimmer_container.dart'; // Assuming you have ShimmerContainer imported
import 'package:Trip/pages/home_page/components/mini_card_shimmer.dart'; // Assuming you have MiniCardShimmer imported
import 'package:Trip/pages/home_page/fees_on_car/components/fees_on_car_skeleton.dart'; // Assuming you have FeesOnCarSkeleton imported
import 'package:Trip/pages/home_page/fees_on_car/components/car_fees_info_card.dart'; // Assuming you have CarFeesInfoCard imported
import 'package:Trip/pages/home_page/fees_on_car/components/fee_card.dart';

import 'components/fees_on_car_content.dart'; // Assuming you have FeeCard imported

class FeesOnCarPage extends StatefulWidget {
  const FeesOnCarPage({Key? key}) : super(key: key);

  @override
  State<FeesOnCarPage> createState() => _FeesOnCarPageState();
}

class _FeesOnCarPageState extends State<FeesOnCarPage> {
  final UserController controller = Get.put<UserController>(UserController());
  late Future<VehicleDebtStatement?> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = fetchData();
  }

  Future<VehicleDebtStatement?> fetchData() async {
    try {
      return await VehicleDebtStatementService.vehicleDebtStatementGet(
          controller.currentuUser!.vehicle!.first.id);
    } catch (e) {
      // Handle error as needed
      print('Error fetching data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var icon = Assets.assetsIconsCard;
    var text = 'دفع الغرامات المتراكمة';
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(vertical: Insets.medium),
        child: CustomFloatingActionButton(icon: icon, text: text),
      ),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
                    horizontal: Insets.medium, vertical: Insets.medium),
        child: FutureBuilder<VehicleDebtStatement?>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return FeesOnCarSkeleton();
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('حدث خط: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                  child: Text('لا يوجد بياتات'),
                );
              } else {
                final vehicleDebtStatementDetails = snapshot.data!;
                return Column(
                  children: [
                    FeesOnCarContent(
                      accumulatedPrice:
                          vehicleDebtStatementDetails.accumulatedPrice,
                      numberOfReceipt:
                          vehicleDebtStatementDetails.numberOfReceipt,
                      feesList: vehicleDebtStatementDetails.debtStatementReceipts,
                    )
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}