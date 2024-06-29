import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/config/utils/const_class.dart';
import 'package:Trip/pages/home_page/components/trip_card.dart';
import 'package:flutter/material.dart';

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
                  from: 'كراج العلاوي ', to: 'كراج ام قصر', price: '3,500'),
              separatorBuilder: (context, index) => Gap(Insets.small),
            )
          ],
        ),
      ),
    );
  }
}

class TripsSequaredInfoCard extends StatelessWidget {
  const TripsSequaredInfoCard({
    super.key,
    required this.title,
    required this.count,
    required this.type,
    required this.iconType,
    required this.percentage,
  });

  final String title;
  final String count;
  final String type;
  final IconData iconType;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius:
              BorderRadius.circular(CoustomBorderTheme.normalBorderRaduis)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Insets.medium, horizontal: Insets.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: CustomFontsTheme.mediumSize,
              ),
            ),
            Text(
              count,
              style: TextStyle(
                fontWeight: CustomFontsTheme.bigWeight,
                fontSize: CustomFontsTheme.veryBigSize,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Gap(1),
                Icon(
                  iconType,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Gap(1),
                Text(
                  '$percentage%',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: CustomFontsTheme.mediumSize),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
