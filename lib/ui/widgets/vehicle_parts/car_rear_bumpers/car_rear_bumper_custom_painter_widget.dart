import 'package:flutter/material.dart';

class CarRearBumperCustomPainterWidget extends StatelessWidget {
  const CarRearBumperCustomPainterWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarRearBumperPainter(
        color: color ?? const Color.fromRGBO(125, 125, 125, 1.0),
      ),
    );
  }
}

class CarRearBumperPainter extends CustomPainter {
  const CarRearBumperPainter({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final carRearBrush = Paint()..color = color;
    final carRearPath = Path()
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width, size.height, 0, size.height)
      ..close();

    canvas.drawPath(carRearPath, carRearBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
