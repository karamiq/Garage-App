import 'package:Trip/pages/home_page/components/latest_trips.dart';
import 'package:Trip/pages/home_page/components/money_transfers.dart';
import 'package:flutter/material.dart';
import '../../../config/constant.dart';

class HomePageBottomHalf extends StatefulWidget {
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
                      CoustomBorderTheme.normalBorderRaduis),
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
            LatestTrips(),
            MoneyTransfers(),
          ],
        ),
      ),
    );
  }
}