import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarCockpitWorkshopCustomPainterWidget extends StatelessWidget
    with EntityCockpick {
  const CarCockpitWorkshopCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarCockpickWorkshopPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class CarCockpickWorkshopPainter extends CustomPainter {
  const CarCockpickWorkshopPainter({required this.color});

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
  bool shouldRepaint(CarCockpickWorkshopPainter oldDelegate) => false;
}
