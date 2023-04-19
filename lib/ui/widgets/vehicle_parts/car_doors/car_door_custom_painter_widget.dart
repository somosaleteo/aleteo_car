import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarDoorsCustomPainterWidget extends StatelessWidget with EntityTrunk {
  const CarDoorsCustomPainterWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarDoorsPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class _CarDoorsPainter extends CustomPainter {
  _CarDoorsPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CarDoorsPainter oldDelegate) => true;
}