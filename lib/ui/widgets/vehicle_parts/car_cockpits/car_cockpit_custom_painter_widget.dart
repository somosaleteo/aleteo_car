import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarCockpitCustomPainterWidget extends StatelessWidget
    with EntityCockpick {
  const CarCockpitCustomPainterWidget({Key? key, this.color}) : super(key: key);

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
      ..quadraticBezierTo(0, 0, size.width / 2, 0)
      ..quadraticBezierTo(size.width, 0, size.width, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CarCockpickPainter oldDelegate) => true;
}
