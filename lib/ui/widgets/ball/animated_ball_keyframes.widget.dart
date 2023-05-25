import 'package:flutter/material.dart';

class AnimatedBallKeyframesWidget extends StatelessWidget {
  const AnimatedBallKeyframesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        width: 400,
        height: 280,
        child: CustomPaint(
          painter: _AnimatedBallPainter(),
        ),
      ),
    );
  }
}

class _AnimatedBallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 9, size.height / 9), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 4.8, size.height / 2.8), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 3.3, size.height / 1.7), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 2.5, size.height / 1.2), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 1.899, size.height / 1.55), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 1.53, size.height / 2.1), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 1.27, size.height / 1.6), size.width / 18, paint);

    canvas.drawCircle(
        Offset(size.width / 1.12, size.height / 1.22), size.width / 18, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
