import 'package:flutter/material.dart';

class CloudsWidget extends StatelessWidget {
  const CloudsWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: 120,
      child: ClipRect(
        child: CustomPaint(
          painter: _CloudsPainter(color: color ?? Colors.white),
        ),
      ),
    );
  }
}

class _CloudsPainter extends CustomPainter {
  _CloudsPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var xScale = size.width / 140;
    var yScale = size.height / 110;
    var offsetX = (size.width - 140) / 2;
    var offsetY = (size.height - 110) / 2;

    Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(50 * xScale, 50 * yScale), radius: 30 * xScale))
      ..addOval(Rect.fromCircle(
          center: Offset(80 * xScale, 50 * yScale), radius: 30 * xScale))
      ..addOval(Rect.fromCircle(
          center: Offset(110 * xScale, 50 * yScale), radius: 30 * xScale))
      ..addOval(Rect.fromCircle(
          center: Offset(70 * xScale, 80 * yScale), radius: 30 * xScale))
      ..addOval(Rect.fromCircle(
          center: Offset(100 * xScale, 80 * yScale), radius: 30 * xScale))
      ..addOval(Rect.fromCircle(
          center: Offset(85 * xScale, 65 * yScale), radius: 30 * xScale));

    canvas.translate(offsetX, offsetY);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
