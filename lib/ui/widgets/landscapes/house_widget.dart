import 'package:flutter/material.dart';

class HouseWidget extends StatelessWidget {
  const HouseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205,
      width: 150,
      child: ClipRRect(
        child: CustomPaint(
          painter: _HousePainter(),
        ),
      ),
    );
  }
}

class _HousePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 15, 63, 15)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.4)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final paintRoof = Paint()
      ..color = const Color.fromARGB(255, 56, 29, 1)
      ..style = PaintingStyle.fill;

    final roofPath = Path()
      ..moveTo(0, size.height * 0.4)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height * 0.4)
      ..close();

    canvas.drawPath(roofPath, paintRoof);

    final paintWindow = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.7),
        size.height * 0.1, paintWindow);

    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.7),
        size.height * 0.1, paintWindow);

    final paintDoor = Paint()
      ..color = const Color.fromARGB(255, 76, 16, 12)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4, size.height * 0.7, size.width * 0.2,
            size.height * 0.3),
        paintDoor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
