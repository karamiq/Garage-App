import 'package:flutter/material.dart';

import 'shimmer_container.dart';

class HomePageHeadShimmer extends StatelessWidget {
  const HomePageHeadShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShimmerContainer(
          width: 55,
          height: 55,
        ),
        ShimmerContainer(
          width: 55,
          height: 55,
        ),
      ],
    );
  }
}
