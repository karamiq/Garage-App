import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/router/router.dart';

import '../../../components/viewed_item_title.dart';
import 'holder_info_row.dart';
import 'viechle_info_row.dart';

class VehiclesPageContent extends StatelessWidget {
  const VehiclesPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    List availableDrivers = [
      HolderInfoRow(
        id: '',
        name: 'محمد علي',
        state: 'بغداد',
        photoUrl: '',
        phoneNumber: '07728833423',
      ),
    ];
    List vehicles = [
      VehiclesInfoRow(
          id: '',
          carType: "سايبة",
          carPlateNumber: '235587',
          carLetter: "ج",
          carState: "السليمانيو"),
      VehiclesInfoRow(
          id: '',
          carType: "بي ام دبليو",
          carPlateNumber: '9356',
          carLetter: "ي",
          carState: "البصرة"),
      VehiclesInfoRow(
          id: '',
          carType: "بي ام دبليو",
          carPlateNumber: '9356',
          carLetter: "ي",
          carState: "البصرة"),
    ];
    return Column(
      children: [
        HomePageHead(
          imageUrl:
              'https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg',
        ),
        Gap(Insets.large * 1.5),
        ViewedItemsTitle(
            mainText: 'المركبات التي تمتلكها',
            secontText: 'رؤية الجميع',
            onTap: () => Get.toNamed(
                  Routes.allVeichlesPage, // Corrected route name
                )),
        Gap(Insets.large * 1.5),
        ListView.separated(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => vehicles[index],
            separatorBuilder: (context, index) => Gap(Insets.small),
            itemCount: vehicles.length),
        Gap(Insets.large),
        ElevatedButton(
            onPressed: () => Get.toNamed(Routes.ownerCarInfoPage,
                arguments: {'isOwner': false}),
            child: ElevatedButtonChild(
                text: 'اضافة مركبة', icon: Assets.assetsIconsPlusCircle)),
        Gap(Insets.medium),
        Divider(),
        Gap(Insets.medium),
        ViewedItemsTitle(
            mainText: 'الحائزين المتوفرين',
            secontText: 'رؤية الجميع',
            onTap: () => Get.toNamed(
                  Routes.allAvailableDriversPage,
                )),
        if (availableDrivers.isNotEmpty)
          ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => HolderInfoRow(
                  name: 'name',
                  state: 'state',
                  id: 'id',
                  phoneNumber: 'phoneNumber',
                  photoUrl:
                      'https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg'),
              separatorBuilder: (context, index) => Gap(Insets.small),
              itemCount: availableDrivers.length),
        if (availableDrivers.isEmpty)
          Column(
            children: [
              Gap(Insets.medium),
              Text('لا يوجد سآىق متوفر'),
            ],
          )
      ],
    );
  }
}
