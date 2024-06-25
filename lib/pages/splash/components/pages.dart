import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';
import 'outlined_half_circle.dart';

class SplashPageStyle extends StatelessWidget {
  const SplashPageStyle({
    required this.top,
    required this.right,
    required this.angle,
    super.key, required this.text, required this.subText, required this.child,
  });
  final double top;
  final double right;
  final double angle;
  final String text;
  final String subText;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: top,
            right: right,
            child: Transform.rotate(
              angle: angle,
              child: CustomPaint(
                painter: HalfCircleOutlinePainter(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000)
                  ),
                  width: 200,
                ),
              ),
            ),
          ),
          Center(
            child: child,
          ),
          Positioned(
              top: 650,
              right: MediaQuery.of(context).size.width / 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      style:
                          TextStyle(fontSize: CustomFontsTheme.veryBigSize, fontWeight: FontWeight.bold)),
                  Text(subText,
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: CustomFontsTheme.mediumSize))
                ],
              )),
        ],
      ),
    );
  }
}
