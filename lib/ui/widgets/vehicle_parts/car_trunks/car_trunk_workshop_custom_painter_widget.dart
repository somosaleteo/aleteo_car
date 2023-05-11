import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarTrunkWorkshopCustomPainterWidget extends StatelessWidget with EntityTrunk {
  const CarTrunkWorkshopCustomPainterWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarTrunkWorkshopPainter(
        color: color ?? const Color.fromRGBO(3, 221, 208, 1.0),
      ),
    );
  }
}

class _CarTrunkWorkshopPainter extends CustomPainter {
  _CarTrunkWorkshopPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final trunkBrush = Paint()..color = color;
    final trunkPath = Path()
      ..lineTo(size.width * 0.85, 0)
      ..quadraticBezierTo(
        size.width,
        0,
        size.width,
        size.height * 0.15,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(trunkPath, trunkBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}