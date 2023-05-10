import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/my_custom_scaffold_widget.dart';

class SinAnimationPage extends StatelessWidget {
  const SinAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyCustomScaffold(
      title: 'Animación de ejemplo del Seno',
      page: Center(
        child: CircleAnimation(),
      ),
    );
  }
}

class CircleAnimation extends StatefulWidget {
  const CircleAnimation({super.key});

  @override
  CircleAnimationState createState() => CircleAnimationState();
}

class CircleAnimationState extends State<CircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _sinAnimation;

  @override
  void initState() {
    super.initState();

    const duration = Duration(seconds: 2);

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    )..repeat(reverse: true);

    _circleAnimation = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

    _sinAnimation = Tween(begin: -1.0, end: 1.0).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        circleAngle: _circleAnimation.value,
        sinOffset: _sinAnimation.value,
      ),
      child: Container(),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double circleAngle;
  final double sinOffset;

  const CirclePainter({
    required this.circleAngle,
    required this.sinOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    final smallCircleOffset = Offset(
      center.dx + cos(circleAngle) * radius,
      center.dy + sin(circleAngle) * radius,
    );
    final smallCirclePaint = Paint()..color = Colors.red;
    canvas.drawCircle(smallCircleOffset, 5.0, smallCirclePaint);

    final sinCircleOffset = Offset(
      center.dx,
      center.dy + sin(sinOffset * pi / 2) * radius,
    );
    final sinCirclePaint = Paint()..color = Colors.blue;
    canvas.drawCircle(sinCircleOffset, 5.0, sinCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class SineCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}
