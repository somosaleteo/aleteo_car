import 'dart:math';

import 'package:flutter/material.dart';

import '../animated_controllers/general_animation_controller.dart';
import '../buttons/animated_icon_button_widget.dart';
import '../custom_shapes_widgets/custom_circle_painter.dart';

class CircleAnimationWidget extends StatefulWidget {
  const CircleAnimationWidget({super.key});

  @override
  CircleAnimationWidgetState createState() => CircleAnimationWidgetState();
}

class CircleAnimationWidgetState extends State<CircleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _sinAnimation;

  @override
  void initState() {
    super.initState();
    const duration = Duration(seconds: 4);

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    )..repeat(reverse: false);

    _circleAnimation = Tween(
      begin: -pi / 2,
      end: 3 * pi / 2,
    ).animate(_controller);

    _sinAnimation = Tween(
      begin: -1.0,
      end: 1.0,
    ).animate(_controller);

    _controller.addListener(() {
      if (generalAnimationController.isPlaying) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CustomCirclePainterWidget(
            circleAngle: _circleAnimation.value,
            sinOffset: _sinAnimation.value,
          ),
          child: Container(),
        ),
        const Positioned(
          right: 20.0,
          bottom: 20.0,
          child: AnimatedIconButtonWidget(),
        ),
      ],
    );
  }
}
