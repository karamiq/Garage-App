import 'package:flutter/material.dart';

import '../../../../config/utils/const_class.dart';

class TripDetailesHead extends StatelessWidget {
  const TripDetailesHead({
    super.key,
    required this.from,
    required this.to,
  });

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
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
              style: TextStyle(
                fontSize: CustomFontsTheme.bigSize,
              ),
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
        Column(
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
              style: TextStyle(
                fontSize: CustomFontsTheme.bigSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
