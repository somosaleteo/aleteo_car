import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarCockpickCustomPainterWidget extends StatelessWidget
    with EntityCockpick {
  const CarCockpickCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarCockpickPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class _CarCockpickPainter extends CustomPainter {
  _CarCockpickPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..cubicTo(
        0, // punto de control inicial x
        size.height * 0.8, // punto de control inicial y
        0, // punto de control final x
        0, // punto de control final y
        size.width / 2, // punto final x
        0,
      )
      ..cubicTo(
        size.width / 2,
        0,
        size.width,
        0,
        size.width,
        size.height * 0.8,
      )
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CarCockpickPainter oldDelegate) => true;
}
