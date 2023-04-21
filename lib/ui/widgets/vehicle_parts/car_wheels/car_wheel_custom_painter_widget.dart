import 'package:aleteo_car/entities.dart';
import 'package:flutter/material.dart';

class CarWheelCustomPainter extends StatelessWidget
    with EntityFrontWheel, EntityRearWheel {
  const CarWheelCustomPainter({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:
          CarWheelPainter(color: color ?? const Color.fromRGBO(0, 0, 0, 1.0)),
    );
  }
}

class CarWheelPainter extends CustomPainter {
  CarWheelPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final radius = centerX; //  D/2

    final circleBrush = Paint()..color = color;

    canvas.drawCircle(Offset(centerX, centerY), radius, circleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
