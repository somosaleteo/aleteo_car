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
  late AnimationController controller;
  late Animation<double> circleAnimation;
  late Animation<double> sinAnimation;

  @override
  void initState() {
    super.initState();
    const duration = Duration(seconds: 4);

    controller = AnimationController(
      vsync: this,
      duration: duration,
    )..repeat(reverse: false);

    circleAnimation = Tween(
      begin: -pi / 2,
      end: 3 * pi / 2,
    ).animate(controller);

    sinAnimation = Tween(
      begin: -1.0,
      end: 1.0,
    ).animate(controller);

    controller.addListener(() {
      if (generalAnimationController.isPlaying) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CustomCirclePainterWidget(
            circleAngle: circleAnimation.value,
            sinOffset: sinAnimation.value,
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
