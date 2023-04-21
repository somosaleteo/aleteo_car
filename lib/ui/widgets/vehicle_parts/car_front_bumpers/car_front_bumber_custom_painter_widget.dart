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
      painter: _CarFrontBumperPainter(
        color: color ?? const Color.fromRGBO(125, 125, 125, 1.0),
      ),
    );
  }
}

class _CarFrontBumperPainter extends CustomPainter {
  _CarFrontBumperPainter({required this.color});

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
  bool shouldRepaint(_CarFrontBumperPainter oldDelegate) => true;
}
