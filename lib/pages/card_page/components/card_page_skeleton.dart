import 'package:Trip/components/custom_list_tile_skeleton.dart';
import 'package:Trip/components/home_page_head_shimmer.dart';
import 'package:Trip/components/shimmer_container.dart';
import 'package:Trip/components/user_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../config/utils/const_class.dart';

class CardPageSkeleton extends StatelessWidget {
  const CardPageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageHeadShimmer(),
        Gap(Insets.medium),
        UserCardShimmer(),
        Gap(Insets.exLarge),
        ShimmerContainer(width: 150),
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: Insets.medium),
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => CustomListTileSkeleton(),
          separatorBuilder: (context, index) => Gap(Insets.small),
        ),
      ],
    );
  }
}
