import 'package:flutter/material.dart';

import '../../../../components/custom_list_tile_skeleton.dart';
import '../../../../components/shimmer_container.dart';
import '../../../../config/constant.dart';
import '../../components/mini_card_shimmer.dart';

class FeesOnCarSkeleton extends StatelessWidget {
  const FeesOnCarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: MiniCardShimmer(),
          ),
          Gap(Insets.medium),
          Expanded(
            child: MiniCardShimmer(),
          )
        ],
      ),
      Gap(Insets.large * 1.5),
      ListView.separated(
          separatorBuilder: (context, index) => Gap(Insets.small),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) => CustomListTileSkeleton())
    ]);
  }
}
