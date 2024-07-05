import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../config/constant.dart';
import '../../../router/router.dart';
import 'components/car_fees_info_card.dart';
import 'components/fee_card.dart';

class FeesOnCarPage extends StatefulWidget {
  const FeesOnCarPage({super.key});

  @override
  State<FeesOnCarPage> createState() => _FeesOnCarPageState();
}

class _FeesOnCarPageState extends State<FeesOnCarPage> {
  void fetchData() {}

  @override
  Widget build(BuildContext context) {
    var fee = '25,000';
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width -
            Insets.exLarge, // Set the desired width
        height: 50, // Set the desired height
        child: ElevatedButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: ElevatedButtonChild(
            icon: Assets.assetsIconsCard,
            text: 'دفع الغرامات المتراكمة',
          ),
        ),
      ),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CarFeesInfoCard(
                    title: 'عدد الغرامات',
                    subTitle: '35',
                    icon: Assets.assetsIconsTrafficSignal,
                    onIconPressed: () {},
                  ),
                ),
                Gap(Insets.medium),
                Expanded(
                  child: CarFeesInfoCard(
                    title: 'مبلغ الغرامات المتراكم',
                    subTitle: '200,000 د. ع.',
                    icon: Assets.assetsIconsDollarSquare,
                    onIconPressed: () {},
                  ),
                )
              ],
            ),
            Gap(Insets.exLarge),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 11,
              //An id is required to be passed as well when the api is to be liked with
              //iwont do it now cuz im lazy :)
              itemBuilder: (context, index) => FeeCard(
                fee: fee,
                //Assuming that this is how when know if it's paid or not
                isFeePaid: true,
              ),
              separatorBuilder: (context, index) => Gap(Insets.small),
            )
          ],
        ),
      ),
    );
  }
}
