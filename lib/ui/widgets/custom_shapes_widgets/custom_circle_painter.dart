import 'dart:math';

import 'package:flutter/material.dart';

class CustomCirclePainterWidget extends CustomPainter {
  final double circleAngle;
  final double sinOffset;

  const CustomCirclePainterWidget({
    required this.circleAngle,
    required this.sinOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) / 2) * 0.95;

    final smallCircleOffset = Offset(
      center.dx + cos(circleAngle) * radius,
      center.dy + sin(circleAngle) * radius,
    );
    final smallCirclePaint = Paint()..color = Colors.red;
    canvas.drawCircle(smallCircleOffset, 5.0, smallCirclePaint);

    final sinCircleOffset = Offset(
      center.dx,
      center.dy + sin(circleAngle) * radius,
      // center.dy + sin(sinOffset * pi) * radius,
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
