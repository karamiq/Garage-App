import 'package:Trip/components/custom_list_tile.dart';
import 'package:Trip/components/shimmer_container.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_svg_style.dart';
import '../../../../components/home_page_bottom_half_shimmer.dart';
import '../../../../components/user_card_shimmer.dart';
import '../../../../config/constant.dart';
import '../../../home_page/components/mini_card_shimmer.dart';

class SelectedCarInfoShimmer extends StatelessWidget {
  const SelectedCarInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Insets.small, vertical: Insets.exSmall),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ShimmerContainer(
                    width: 55,
                    height: 55,
                  ),
                  Gap(Insets.small),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer(width: 80),
                      Gap(Insets.small),
                      ShimmerContainer(width: 100),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShimmerContainer(
                    width: 55,
                    height: 55,
                  ),
                  Gap(Insets.small),
                  ShimmerContainer(
                    width: 30,
                    height: 30,
                  ),
                ],
              )
            ],
          ),
        ),
        Gap(Insets.medium),
        UserCardShimmer(),
        Gap(Insets.small),
        Row(
          children: [
            MiniCardShimmer(),
            Gap(Insets.small),
            MiniCardShimmer(),
          ],
        ),
        Gap(Insets.small),
        HomePageBottomHalfShimmer(),
        Gap(Insets.small),
        ShimmerContainer(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    CustomBorderTheme.normalBorderRadius)),
            child: ListTile(
              leading: Container(
                  padding: EdgeInsets.all(Insets.small),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        CustomBorderTheme.normalBorderRadius),
                  ),
                  child: ShimmerContainer(
                    width: 35,
                    height: 35,
                  )),
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: Insets.small),
                child: ShimmerContainer(
                  width: 60,
                  height: 15,
                ),
              ),
              subtitle: ShimmerContainer(
                width: 30,
                height: 15,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerContainer(width: 60),
                  Gap(Insets.small),
                  ShimmerContainer(width: 60),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
