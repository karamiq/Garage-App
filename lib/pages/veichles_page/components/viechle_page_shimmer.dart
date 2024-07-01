import 'package:Trip/components/home_page_head_shimmer.dart';
import 'package:Trip/components/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/viewed_item_title.dart';
import '../../../config/utils/const_class.dart';

class ViechlePageShimmer extends StatelessWidget {
  const ViechlePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageHeadShimmer(),
        Gap(Insets.large * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerContainer(
              width: 150,
              height: 40,
            ),
            ShimmerContainer(
              width: 50,
            ),
          ],
        ),
        Gap(Insets.large * 1.5),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            //The filtered list must be applied here when linking with api
            itemBuilder: (context, index) => ShimmerContainer(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Insets.exSmall),
                    child: ListTile(),
                  ),
                ),
            separatorBuilder: (context, index) => Gap(Insets.small),
            itemCount: 3),
        Gap(Insets.large),
        ShimmerContainer(
          width: double.infinity,
          height: 50,
        ),
        Gap(Insets.medium),
        Divider(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        Gap(Insets.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerContainer(
              width: 150,
              height: 30,
            ),
            ShimmerContainer(
              width: 50,
            ),
          ],
        ),
        Gap(Insets.medium),
        ShimmerContainer(
          width: double.infinity,
          child: ListTile(),
        ),
      ],
    );
  }
}
