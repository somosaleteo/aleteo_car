import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarBonnetCustomPainterWidget extends StatelessWidget
    with EntityCarBonnet {
  const CarBonnetCustomPainterWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarBonnetPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class CarBonnetPainter extends CustomPainter {
  const CarBonnetPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0, 0, size.height * 0.5, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CarBonnetPainter oldDelegate) => false;
}
