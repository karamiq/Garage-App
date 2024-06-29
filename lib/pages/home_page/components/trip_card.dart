import 'package:flutter/material.dart';

import '../../../config/constant.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.from,
    required this.to,
    required this.price,
  });

  final String from;
  final String to;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.01,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Insets.small - 5, vertical: Insets.small),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(Insets.small),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          CoustomBorderTheme.normalBorderRaduis),
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsIconsRouting,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Gap(Insets.small),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'من',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: CustomFontsTheme.smallSize,
                        ),
                      ),
                      Text(from),
                    ],
                  ),
                ],
              ),
              Container(
                height: 40.0,
                child: VerticalDivider(
                  color: Theme.of(context).colorScheme.secondary,
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الى',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: CustomFontsTheme.smallSize,
                        ),
                      ),
                      Text(to)
                    ],
                  ),
                  Gap(Insets.medium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'السعر الكلي',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: CustomFontsTheme.smallSize,
                        ),
                      ),
                      Text('$price د. ع.')
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_right_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    iconSize: Insets.large,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
