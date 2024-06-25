import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../config/constant.dart';

class HalfCircleOutlinePainter extends CustomPainter {
  BuildContext context;
  HalfCircleOutlinePainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 250.0;
    // Calculate the center of the circle
    final center = Offset(size.width, size.height);

    // Calculate the radius of the circle (half of the minimum dimension)
    final radius = size.width / .5;

    // Create a path and draw a half circle arc
    final path = Path()
      ..moveTo(center.dx, center.dy) // Move to the center
      ..arcTo(Rect.fromCircle(center: center, radius: radius), math.pi, math.pi,
          true); // Draw a half circle arc
    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
