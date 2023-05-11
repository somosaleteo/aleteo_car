import 'package:flutter/material.dart';

class TreeWidget extends StatelessWidget {
  const TreeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 200,
      child: ClipRRect(
        child: CustomPaint(
          painter: _TreePainter(),
        ),
      ),
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
        Rect.fromLTWH(size.width / 2 - 10, size.height - 100, 30, 100), paint);

    paint.color = Colors.green;

    canvas.drawCircle(Offset(size.width / 2, size.height - 150), 50, paint);
    canvas.drawCircle(
        Offset(size.width / 2 - 25, size.height - 190), 50, paint);
    canvas.drawCircle(
        Offset(size.width / 2 + 25, size.height - 190), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
