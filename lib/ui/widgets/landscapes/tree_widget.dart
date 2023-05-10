import 'package:flutter/material.dart';

class TreeWidget extends StatelessWidget {
  const TreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: _TreePainter(),
    );
  }
}

class _TreePainter extends CustomPainter {
  _TreePainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH(size.width / 2 - 10, size.height - 60, 20, 60), paint);

    paint.color = Colors.green;

    canvas.drawCircle(Offset(size.width / 2, size.height - 100), 30, paint);
    canvas.drawCircle(
        Offset(size.width / 2 - 20, size.height - 140), 30, paint);
    canvas.drawCircle(
        Offset(size.width / 2 + 20, size.height - 140), 30, paint);

    canvas.drawLine(Offset(size.width / 2, size.height - 130),
        Offset(size.width / 2, size.height - 90), paint);

    canvas.drawLine(Offset(size.width / 2, size.height - 110),
        Offset(size.width / 2 - 15, size.height - 130), paint);

    canvas.drawLine(Offset(size.width / 2, size.height - 110),
        Offset(size.width / 2 + 15, size.height - 130), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
