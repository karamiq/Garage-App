import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/config/utils/const_class.dart';
import 'package:Trip/components/trip_card.dart';
import 'package:flutter/material.dart';

import '../components/trips_sequared_card.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.medium),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TripsSequaredInfoCard(
                    title: 'عدد الرحلات الكلية',
                    count: '50',
                    type: 'زيادة',
                    iconType: Icons.trending_up_outlined,
                    percentage: '+6.08'),
                TripsSequaredInfoCard(
                    title: 'عدد الرحلات الأسبوعية',
                    count: '18',
                    type: 'زيادة',
                    iconType: Icons.trending_up_outlined,
                    percentage: '+2.03'),
              ],
            ),
            Gap(Insets.medium),
            ListView.separated(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (context, index) => TripCard(
                  from: 'كراج السليمانية  ',
                  to: 'كراج صلاح اغعفلغ',
                  price: '3,500'),
              separatorBuilder: (context, index) => Gap(Insets.small),
            )
          ],
        ),
      ),
    );
  }
}
