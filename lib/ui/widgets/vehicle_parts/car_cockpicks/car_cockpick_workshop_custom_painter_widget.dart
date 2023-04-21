import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarCockpickWorkshopCustomPainterWidget extends StatelessWidget
    with EntityCockpick {
  const CarCockpickWorkshopCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarCockpickWorkshopPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class _CarCockpickWorkshopPainter extends CustomPainter {
  _CarCockpickWorkshopPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
        //TODO Code Here
        ;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_CarCockpickWorkshopPainter oldDelegate) => true;
}
