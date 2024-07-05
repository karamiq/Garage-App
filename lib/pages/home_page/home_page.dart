import 'dart:async';
import 'package:Trip/config/constant.dart';
import 'package:Trip/model/Profiles/profile.dart';
import 'package:Trip/services/mobile_home/dio_home.dart';
import 'package:flutter/material.dart';
import '../../components/custom_list_tile.dart';
import '../../components/trip_card.dart';
import '../../controller/current_user_controller.dart';
import 'components/home_page_content.dart';
import 'components/home_page_skeleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController controller = Get.put<UserController>(UserController());
  Future<dynamic> fetchData() async {}
  Future<Profile>? homeDetaies;
  @override
  void initState() {
    homeDetaies = HomeService.homeGet();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
  var user  = controller.currentuUser!;
    Widget content;
    if (homeDetaies == null) {
      content = HomePageSkeleton();
    } else {
      content = HomePageContent(
        imageUrl: user.image! ,
        carPlateInfo: '24214 أ / بغداد',
        carType: user.vehicle![0].vehicleModelName,
        expireDate: ' 10/12/2025',
        cardNumber: user.identityNumber!,
        qrData: 'https://github.com/karamiq/Garage-App',
        cardMoney: 125000,
        feesCardTitle: 'الغرامات المالية',
        feesCardNumber: '20',
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.medium),
          child: content,
        ));
  }
}
