
import 'package:flutter/material.dart';

import '../config/utils/const_class.dart';

class ShakeButton extends StatefulWidget {
  final Function()? onPress;
  final String text;
  final Icon icon;
  final bool shaking;

  const ShakeButton({Key? key, required this.onPress, required this.shaking, required this.text,required this.icon})
      : super(key: key);

  @override
  _ShakeButtonState createState() => _ShakeButtonState();
}

class _ShakeButtonState extends State<ShakeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 10)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void didUpdateWidget(covariant ShakeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shaking) {
      _controller.forward();
    } else {
      _controller.reset();
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: ElevatedButton(
            onPressed: widget.onPress,
            child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.text),
                    SizedBox(width: Insets.small),
                    widget.icon,
                  ],
                ),
          ),
        );
      },
    );
  }
}
