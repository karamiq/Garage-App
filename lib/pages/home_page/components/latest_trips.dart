import 'package:flutter/material.dart';
import '../../../config/constant.dart';
import 'trip_card.dart';

class LatestTrips extends StatelessWidget {
  const LatestTrips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var from = 'كراج العلاوي ';
    var to = 'كراج ام قصر';
    var price = '6,500';
    return Container(
        child: ListView.separated(
      itemCount: 7,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Gap(Insets.small),
      itemBuilder: (context, index) =>
          TripCard(from: from, to: to, price: price),
    ));
  }
}
