import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/pages/home_page/components/trip_card.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/viewed_item_title.dart';
import 'components/holder_info_row.dart';
import 'components/viechle_info_row.dart';

class VeichlesPage extends StatelessWidget {
  const VeichlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: Column(
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
            VehiclesInfoRow(
                carType: "سايبة",
                carPlateNumber: '235587',
                carLetter: "ج",
                carState: "السليمانيو"),
            VehiclesInfoRow(
                carType: "بي ام دبليو",
                carPlateNumber: '9356',
                carLetter: "ي",
                carState: "البصرة"),
            VehiclesInfoRow(
                carType: "بي ام دبليو",
                carPlateNumber: '9356',
                carLetter: "ي",
                carState: "البصرة"),
            Gap(Insets.large),
            ElevatedButton(
                onPressed: () => Get.toNamed(Routes.ownerCarInfoPage,
                    arguments: {'isOwner': false}),
                child: ElevatedButtonChild(
                    text: 'اضافة مركبة', icon: Assets.assetsIconsPlusCircle)),
            Gap(Insets.large),
            Divider(),
            Gap(Insets.large),
            ViewedItemsTitle(
                mainText: 'الحائزين المتوفرين',
                secontText: 'رؤية الجميع',
                onTap: () => Get.toNamed(
                      Routes.allAvailableDriversPage,
                    )),
            HolderInfoRow(
              id: '',
              name: 'محمد علي',
              state: 'بغداد',
              photoUrl: '',
              phoneNumber: '07728833423',
            )
          ],
        ),
      ),
    );
  }
}
