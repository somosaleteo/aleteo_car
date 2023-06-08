import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarBonnetWorkshopCustomPainterWidget extends StatelessWidget
    with EntityCarBonnet {
  const CarBonnetWorkshopCustomPainterWidget({Key? key, this.color})
      : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CarBonnetWorkshopPainter(
          color: color ?? const Color.fromRGBO(3, 221, 208, 1.0)),
    );
  }
}

class CarBonnetWorkshopPainter extends CustomPainter {
  const CarBonnetWorkshopPainter({required this.color});

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
  bool shouldRepaint(CarBonnetWorkshopPainter oldDelegate) => false;
}
