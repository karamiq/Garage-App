import 'package:Trip/router/router.dart';
import 'package:flutter/material.dart';

import '../../../config/constant.dart';

class TripCard extends StatelessWidget {
  const TripCard(
      {super.key,
      required this.from,
      required this.to,
      required this.price,
      this.id = ''});

  final String id;
  final String from;
  final String to;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(CustomBorderTheme.normalBorderRadius),
      onTap: () => Get.toNamed(Routes.tripsPage + Routes.trpiDetailesPage,
          arguments: {'id': id}),
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Insets.small, horizontal: Insets.small),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius:
                  BorderRadius.circular(CustomBorderTheme.normalBorderRadius)),
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
                          CustomBorderTheme.normalBorderRadius),
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
                  Gap(Insets.small),
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
                  SvgPicture.asset(
                    Assets.assetsIconsCaretLeft,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
