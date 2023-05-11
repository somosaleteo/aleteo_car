import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarDoorsWorkshopCustomPainterWidget extends StatelessWidget
    with EntityTrunk {
  const CarDoorsWorkshopCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarDoorsWorkshopPainter(
          color: color ?? const Color.fromARGB(255, 225, 155, 111)),
    );
  }
}

class _CarDoorsWorkshopPainter extends CustomPainter {
  _CarDoorsWorkshopPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()..color = color;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(_CarDoorsWorkshopPainter oldDelegate) => true;
}