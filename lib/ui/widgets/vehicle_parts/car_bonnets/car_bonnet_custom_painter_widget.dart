import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarBonnetCustomPainterWidget extends StatelessWidget
    with EntityCarBonnet {
  const CarBonnetCustomPainterWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarBonnetPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class _CarBonnetPainter extends CustomPainter {
  _CarBonnetPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.485)
      ..cubicTo(
        0, // punto de control inicial x
        size.height * 0.485, // punto de control inicial y
        0, // punto de control final x
        0, // punto de control final y
        size.width * 0.515, // punto final x
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CarBonnetPainter oldDelegate) => true;
}