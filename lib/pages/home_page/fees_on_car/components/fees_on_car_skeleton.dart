import 'package:flutter/material.dart';

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
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ShimmerContainer(
                  width: 10,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: Insets.small),
                    leading: ShimmerContainer(
                      width: 40, height: 40, shape: BoxShape.rectangle,
                    ),
                    title: ShimmerContainer(width: 60),
                    subtitle: Padding(
                      padding:  EdgeInsets.only(top: Insets.small),
                      child: Row(
                        children: [
                          ShimmerContainer(
                            width: 160,
                            height: 10,
                          ),
                          Spacer(),
                           ShimmerContainer(
                            width: 100,
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ))
    ]);
  }
}
