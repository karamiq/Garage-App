import 'package:Trip/components/home_page_head_shimmer.dart';
import 'package:Trip/components/shimmer_container.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

import '../../../config/utils/const_class.dart';

class PathPageShimmer extends StatelessWidget {
  const PathPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShimmerContainer(
          color: Theme.of(context).colorScheme.onInverseSurface,
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.medium),
            child: Column(
              children: [
                Gap(Insets.small),
                HomePageHeadShimmer(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Insets.small, vertical: Insets.medium),
            child: ShimmerContainer(
              width: double.infinity,
              child: ListTile(),
            ),
          ),
        ),
      ],
    );
  }
}
