import 'package:flutter/material.dart';

class CarRearLightWorkshopCustomPainterWidget extends StatelessWidget {
  const CarRearLightWorkshopCustomPainterWidget({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CarRearLightWorkshopPainter(
          color: color ?? const Color.fromRGBO(225, 0, 0, 1.0)),
    );
  }
}

class _CarRearLightWorkshopPainter extends CustomPainter {
  _CarRearLightWorkshopPainter({required this.color});

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final carRearLightBrush = Paint()..color = color;
    final carRearPath = Path()
        //TODO Code Here
        ;

    canvas.drawPath(carRearPath, carRearLightBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
