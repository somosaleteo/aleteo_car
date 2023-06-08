import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarDoorsCustomPainterWidget extends StatelessWidget with EntityTrunk {
  const CarDoorsCustomPainterWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarDoorsPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class CarDoorsPainter extends CustomPainter {
  const CarDoorsPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()..color = color;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CarDoorsPainter oldDelegate) => false;
}
