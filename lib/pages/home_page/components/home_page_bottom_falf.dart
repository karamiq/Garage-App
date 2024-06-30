import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/pages/home_page/latest_trips/latest_trips.dart';
import 'package:Trip/pages/home_page/components/money_transfers.dart';
import 'package:Trip/components/trip_card.dart';
import 'package:flutter/material.dart';
import '../../../config/constant.dart';

class HomePageBottomHalf extends StatefulWidget {
  final List latestTripsList;
  final List moneyTransfersList;

  const HomePageBottomHalf(
      {super.key,
      required this.latestTripsList,
      required this.moneyTransfersList});
  @override
  _HomePageBottomHalfState createState() => _HomePageBottomHalfState();
}

class _HomePageBottomHalfState extends State<HomePageBottomHalf>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scorllingController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scorllingController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scorllingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scorllingController,
        headerSliverBuilder: (context, isScroll) => [
          SliverAppBar(
            primary: false,
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: TabBar(
                tabAlignment: TabAlignment.center,
                dividerColor: Colors.transparent,
                labelColor: Theme.of(context).scaffoldBackgroundColor,
                unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                indicatorPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius),
                  color: Theme.of(context).colorScheme.primary,
                ),
                tabs: [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.exLarge, vertical: Insets.exSmall),
                      child: Text('اخر الرحلات'),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.exLarge, vertical: Insets.exSmall),
                      child: Text('التحويلات المالية'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            LatestTrips(latestTripsList: widget.latestTripsList),
            MoneyTransfers(moneyTransfersList: widget.moneyTransfersList),
          ],
        ),
      ),
    );
  }
}
