import 'package:Trip/pages/home_page/components/decoration_container.dart';
import 'package:flutter/material.dart';

class SequaredPositionedContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(right: 135, top: 11, child: SequaredContainer()),
        Positioned(right: 145, top: 11, child: SequaredContainer()),
        Positioned(right: 155, top: 11, child: SequaredContainer()),
        Positioned(right: 165, top: 11, child: SequaredContainer()),
        Positioned(right: 175, top: 11, child: SequaredContainer()),
        Positioned(right: 185, top: 11, child: SequaredContainer()),
        Positioned(right: 195, top: 11, child: SequaredContainer()),
        Positioned(right: 205, top: 11, child: SequaredContainer()),
        Positioned(right: 215, top: 11, child: SequaredContainer()),
      ],
    );
  }
}

class CirculerPositionedContainers extends StatelessWidget {
  const CirculerPositionedContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(right: 90, bottom: 50, child: CirculerContainer()),
        Positioned(right: 100, bottom: 60, child: CirculerContainer()),
        Positioned(right: 110, bottom: 70, child: CirculerContainer()),
        Positioned(right: 120, bottom: 80, child: CirculerContainer()),
        Positioned(right: 130, bottom: 90, child: CirculerContainer()),
        Positioned(right: 140, bottom: 100, child: CirculerContainer()),
        Positioned(right: 150, bottom: 110, child: CirculerContainer()),
      ],
    );
  }
}
