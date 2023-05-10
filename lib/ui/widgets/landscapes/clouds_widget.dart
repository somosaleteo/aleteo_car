import 'package:flutter/material.dart';

class CloudsWidget extends StatelessWidget {
  const CloudsWidget({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(
        painter: _CloudsPainter(color: color ?? Colors.white),
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

    canvas.drawCircle(const Offset(50, 50), 30, paint);
    canvas.drawCircle(const Offset(80, 50), 30, paint);
    canvas.drawCircle(const Offset(110, 50), 30, paint);
    canvas.drawCircle(const Offset(70, 80), 30, paint);
    canvas.drawCircle(const Offset(100, 80), 30, paint);
    canvas.drawCircle(const Offset(85, 65), 30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
