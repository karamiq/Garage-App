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
            primary:false ,
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
                labelPadding: EdgeInsets.symmetric(horizontal: 50), //
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
                    child: Text('اخر الرحلات'),
                  ),
                  Tab(
                    child: Text('التحويلات المالية'),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              child:ListView.separated(
                itemCount: 7,
                separatorBuilder: (context, index) => Gap(Insets.small),
                itemBuilder: (context, index) => Card(
                color: Theme.of(context).scaffoldBackgroundColor,
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Insets.medium - 5, vertical: Insets.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(Insets.small),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      CoustomBorderTheme.normalBorderRaduis),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface),
                              child: SvgPicture.asset(
                                Assets.assetsIconsRouting,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                          Gap(Insets.exSmall),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('من'),
                              Text('كراج العلاوي '),
                            ],
                          ),
                        ],
                      ),
                      VerticalDivider(),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('الى'), Text('كراج ام قصر')],
                          ),
                          Gap(Insets.small),
                          Column(
                            children: [Text('dfkljdfls'), Text('dfkljdfls')],
                          ),
                          Gap(Insets.small),
                          Icon(Icons.chevron_right_outlined, color: Theme.of(context).colorScheme.primary,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),)
            ),
            Material(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('dflkjfdlkf'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
