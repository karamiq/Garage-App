import 'package:flutter/material.dart';

class SequaredContainer extends StatelessWidget {
  const SequaredContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.25 * 3.14,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary)),
      ),
    );
  }
}

class CirculerContainer extends StatelessWidget {
  const CirculerContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).colorScheme.inversePrimary),
          shape: BoxShape.circle),
    );
  }
}
