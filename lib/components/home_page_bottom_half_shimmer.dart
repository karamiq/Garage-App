import 'package:Trip/components/shimmer_container.dart';
import 'package:flutter/material.dart';

import '../config/constant.dart';

class HomePageBottomHalfShimmer extends StatelessWidget {
  const HomePageBottomHalfShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: ShimmerContainer(
                width: 100,
                height: 55,
              ),
            ),
            Gap(Insets.medium),
            Expanded(
              flex: 4,
              child: ShimmerContainer(
                width: 100,
                height: 55,
              ),
            ),
          ],
        ),
        Gap(Insets.small),
        ShimmerContainer(child: ListTile(), width: double.infinity),
      ],
    );
  }
}
