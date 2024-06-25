
import 'package:flutter/material.dart';

class CustomAuthStepsTracker extends StatelessWidget {
  final int highlightIndex;
  final int itemCount;
  final double itemWidth;
  final double itemHeight;
  final double itemMargin;
  final double borderWidth;
  final double borderRadius;

  const CustomAuthStepsTracker({
    Key? key,
    required this.highlightIndex,
    this.itemCount = 4,
    this.itemWidth = 40.0,
    this.itemHeight = 10.0,
    this.itemMargin = 4.0,
    this.borderWidth = 1.0,
    this.borderRadius = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          width: itemWidth,
          height: itemHeight,
          margin: EdgeInsets.all(itemMargin),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withAlpha(120),
              width: borderWidth*3,
            ),
            color: index == highlightIndex
                ? Theme.of(context).colorScheme.primary
                : (index < highlightIndex
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0)),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}