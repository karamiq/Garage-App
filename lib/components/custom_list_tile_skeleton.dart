import 'package:flutter/material.dart';

import '../config/utils/const_class.dart';
import 'shimmer_container.dart';

class CustomListTileSkeleton extends StatelessWidget {
  const CustomListTileSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      width: double.infinity,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: Insets.small),
        leading: ShimmerContainer(
          width: 40,
          height: 40,
          shape: BoxShape.rectangle,
        ),
        title: ShimmerContainer(width: 60),
        subtitle: Padding(
          padding: EdgeInsets.only(top: Insets.small),
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
    );
  }
}
