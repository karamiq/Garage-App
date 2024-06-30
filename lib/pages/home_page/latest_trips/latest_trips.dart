import '../../../config/constant.dart';

class LatestTrips extends StatelessWidget {
  const LatestTrips({
    super.key,
    required this.latestTripsList,
  });
  final List latestTripsList;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: Insets.medium),
        child: ListView.separated(
          itemCount: latestTripsList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Gap(Insets.small),
          itemBuilder: (context, index) => latestTripsList[index],
        ));
  }
}
