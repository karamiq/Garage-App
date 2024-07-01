import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../config/utils/const_class.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    required this.width,
    this.height,
    this.shape = BoxShape.rectangle,
    this.child,
    this.color,
  });
  final double width;
  final double? height;
  final Color? color;
  final Widget? child;
  final BoxShape shape;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: color ?? Theme.of(context).colorScheme.primary,
        highlightColor: Theme.of(context).colorScheme.surface,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              shape: shape,
              color: const Color.fromARGB(50, 96, 125, 139),
              borderRadius: shape != BoxShape.rectangle
                  ? null
                  : BorderRadius.circular(
                      CustomBorderTheme.normalBorderRadius)),
          child: child ?? const Text(''),
        ),
      ),
    );
  }
}
