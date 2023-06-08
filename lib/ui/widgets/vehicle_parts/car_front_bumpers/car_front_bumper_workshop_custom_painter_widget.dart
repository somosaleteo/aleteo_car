import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarFrontBumperWorkshopCustomPainterWidget extends StatelessWidget
    with EntityFrontBumper {
  const CarFrontBumperWorkshopCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarFrontWorkshopBumperPainter(
        color: color ?? const Color.fromRGBO(125, 125, 125, 1.0),
      ),
    );
  }
}

class CarFrontWorkshopBumperPainter extends CustomPainter {
  const CarFrontWorkshopBumperPainter({required this.color});

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
  bool shouldRepaint(CarFrontWorkshopBumperPainter oldDelegate) => false;
}
