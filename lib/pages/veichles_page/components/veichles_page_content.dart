import 'package:flutter/material.dart';
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/router/router.dart';

import '../../../components/viewed_item_title.dart';
import 'holder_info_row.dart';
import 'viechle_info_row.dart';

class VeichlesPageContent extends StatelessWidget {
  const VeichlesPageContent({super.key});

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
    List viechles = [
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
          imageUrl: Assets.assetsImagesAvatarImage,
        ),
        Gap(Insets.large * 1.5),
        ViewedItemsTitle(
            mainText: 'المركبات التي تمتلكها',
            secontText: 'رؤية الجميع',
            onTap: () => Get.toNamed(
                  Routes.allVeichlesPage,
                )),
        Gap(Insets.large * 1.5),
        ListView.separated(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            //The filtered list must be applied here when linking with api
            itemBuilder: (context, index) => viechles[index],
            separatorBuilder: (context, index) => Gap(Insets.small),
            itemCount: viechles.length),
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
              //The filtered list must be applied here when linking with api
              itemBuilder: (context, index) => availableDrivers[index],
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
