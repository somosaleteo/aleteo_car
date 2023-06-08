import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarFrontBumperCustomPainterWidget extends StatelessWidget
    with EntityFrontBumper {
  const CarFrontBumperCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarFrontBumperPainter(
        color: color ?? const Color.fromRGBO(125, 125, 125, 1.0),
      ),
    );
  }
}

class CarFrontBumperPainter extends CustomPainter {
  const CarFrontBumperPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(0, size.height, 0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CarFrontBumperPainter oldDelegate) => false;
}
