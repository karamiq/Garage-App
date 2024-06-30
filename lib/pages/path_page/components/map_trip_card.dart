import 'package:flutter/material.dart';

import '../../../config/constant.dart';

class MapTripCard extends StatelessWidget {
  const MapTripCard({
    super.key,
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Insets.medium,
      right: MediaQuery.of(context).size.width / 20,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        height: 60,
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: Insets.small, horizontal: Insets.small),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(
                    CustomBorderTheme.normalBorderRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(Insets.small),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              CustomBorderTheme.normalBorderRadius),
                          color: Theme.of(context).colorScheme.onInverseSurface,
                        ),
                        child: SvgPicture.asset(
                          Assets.assetsIconsRouting,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Gap(Insets.small),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'من',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: CustomFontsTheme.smallSize,
                              ),
                            ),
                            Text(
                              from,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  child: VerticalDivider(
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Gap(Insets.exSmall),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الى',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: CustomFontsTheme.smallSize,
                              ),
                            ),
                            Text(
                              to,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
