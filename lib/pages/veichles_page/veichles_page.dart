import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/components/custom_svg_style.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/pages/home_page/components/trip_card.dart';
import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';

import '../../components/viewed_item_title.dart';

class VeichlesPage extends StatelessWidget {
  const VeichlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Insets.medium),
        child: Column(
          children: [
            HomePageHead(),
            Gap(Insets.large * 1.5),
            ViewedItemsTitle(
                mainText: 'أخر التحويلات المالية',
                secontText: 'رؤية الجميع',
                onTap: () => Get.toNamed(
                      Routes.seeAllPage,
                    )),
            Gap(Insets.large * 1.5),
            Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.onSecondary,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Insets.small + Insets.exSmall,
                      vertical: Insets.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomISvgStyle(icon: Assets.assetsIconsCar),
                          Gap(Insets.small),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'السيارة',
                                style: TextStyle(
                                    fontSize: CustomFontsTheme.verySmallSize),
                              ),
                              Text('كورلا')
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        child: VerticalDivider(),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الرقم',
                                style: TextStyle(
                                    fontSize: CustomFontsTheme.verySmallSize),
                              ),
                              Text('24214 أ / بغداد')
                            ],
                          ),
                          Gap(Insets.medium),
                          SvgPicture.asset(Assets.assetsIconsCaretLeft,
                              color: Theme.of(context).colorScheme.primary)
                        ],
                      ),
                    ],
                  ),
                )),
            TripCard(from: 'from', to: 'to', price: 'price'),
            CustomListTile(
                icon: Assets.assetsIconsCar,
                title: 'ff',
                subtitle: 'subtitle',
                trailing1: 'fddffd',
                trailing2: 'trailing2')
          ],
        ),
      ),
    );
  }
}
/*
Row(
        
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(Insets.small),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        CustomBorderTheme.normalBorderRadius),
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  child: SvgPicture.asset(
                    Assets.assetsIconsRouting,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Gap(Insets.small),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'من',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: CustomFontsTheme.smallSize,
                      ),
                    ),
                    Text(from),
                  ],
                ),
              ],
            ),
            Container(
              height: 40.0,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.secondary,
                thickness: 1,
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'الى',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: CustomFontsTheme.smallSize,
                      ),
                    ),
                    Text(to)
                  ],
                ),
                Gap(Insets.medium),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'السعر الكلي',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: CustomFontsTheme.smallSize,
                      ),
                    ),
                    Text('$price د. ع.')
                  ],
                ),
                IconButton(
                  onPressed: () => Get.toNamed(
                      Routes.tripsPage + Routes.trpiDetailesPage,
                      arguments: {'id': id}),
                  icon: Icon(
                    Icons.chevron_right_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  iconSize: Insets.large,
                ),
              ],
            );*/