import 'package:Trip/components/user_card_clipper.dart';
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

import 'shimmer_container.dart';

class UserCardShimmer extends StatelessWidget {
  const UserCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.onSecondary,
      child: Stack(
        children: [
          ClipPath(
            clipper: UserCardClipper(),
            child: ShimmerContainer(
              width: double.infinity,
              height: 210,
              child: Padding(
                padding: EdgeInsets.all(
                  Insets.small,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ShimmerContainer(
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ShimmerContainer(
                                width: 60,
                              ),
                              Gap(Insets.small),
                              ShimmerContainer(
                                width: 80,
                              ),
                            ],
                          ),
                          Gap(Insets.small),
                          ShimmerContainer(
                            width: 90,
                          ),
                          Gap(Insets.small),
                          ShimmerContainer(width: 200, height: 30),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ShimmerContainer(
                                width: 80,
                                height: 25,
                              ),
                              Gap(Insets.small),
                              ShimmerContainer(
                                width: 80,
                                height: 25,
                              ),
                            ],
                          ),
                          Gap(Insets.small),
                          ShimmerContainer(
                            width: 160,
                            height: 25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ShimmerContainer(
                  shape: BoxShape.circle,
                  width: 60,
                  height: 60,
                ),
              )),
        ],
      ),
    );
  }
}
