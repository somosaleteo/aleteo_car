import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarFrontLightCustomPainterWidget extends StatelessWidget
    with EntityFrontLight {
  const CarFrontLightCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarFrontLightPainter(
        color: color ?? const Color.fromRGBO(225, 0, 0, 1.0),
      ),
    );
  }
}

class _CarFrontLightPainter extends CustomPainter {
  _CarFrontLightPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(0, 0, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CarFrontLightPainter oldDelegate) => true;
}
