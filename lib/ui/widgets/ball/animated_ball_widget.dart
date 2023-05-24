import 'package:flutter/material.dart';

class AnimatedBall extends StatelessWidget {
  const AnimatedBall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red.shade100,
            style: BorderStyle.solid,
            width: 10.0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          width: 400,
          height: 280,
          child: CustomPaint(
            painter: _AnimatedBallPainter(),
          ),
        ),
      ),
    );
  }
}

class _AnimatedBallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 9, size.height / 9), size.width / 14, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
