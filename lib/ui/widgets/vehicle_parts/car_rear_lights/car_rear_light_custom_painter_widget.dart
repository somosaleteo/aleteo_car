import 'package:flutter/material.dart';

class CarRearLightCustomPainterWidget extends StatelessWidget {
  const CarRearLightCustomPainterWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarRearLightPainter(
          color: color ?? const Color.fromRGBO(225, 0, 0, 1.0)),
    );
  }
}

class CarRearLightPainter extends CustomPainter {
  const CarRearLightPainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final carRearLightBrush = Paint()..color = color;
    final carRearPath = Path()
      ..quadraticBezierTo(size.width, 0, size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(carRearPath, carRearLightBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
