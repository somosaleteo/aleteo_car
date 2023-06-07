import 'package:flutter/material.dart';

class BuildingWidget extends StatelessWidget {
  final double width;
  final double height;

  const BuildingWidget({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: BuildingPainter(),
    );
  }
}

class BuildingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueGrey[800]!
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.3)
      ..lineTo(size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final paintWindow = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(size.width * 0.4, size.height * 0.4, size.width * 0.2,
                size.height * 0.2),
            const Radius.circular(15)),
        paintWindow);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(size.width * 0.1, size.height * 0.4, size.width * 0.2,
                size.height * 0.2),
            const Radius.circular(15)),
        paintWindow);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(size.width * 0.7, size.height * 0.4, size.width * 0.2,
                size.height * 0.2),
            const Radius.circular(15)),
        paintWindow);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(size.width * 0.1, size.height * 0.7, size.width * 0.2,
                size.height * 0.2),
            const Radius.circular(15)),
        paintWindow);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(size.width * 0.7, size.height * 0.7, size.width * 0.2,
                size.height * 0.2),
            const Radius.circular(15)),
        paintWindow);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(size.width * 0.7, size.height * 0.4, size.width * 0.2,
                size.height * 0.2),
            const Radius.circular(15)),
        paintWindow);

    final paintDoor = Paint()
      ..color = const Color.fromARGB(255, 76, 16, 12)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4, size.height * 0.7, size.width * 0.2,
            size.height * 0.3),
        paintDoor);

    final paintRoof = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;

    final pathRoof = Path()
      ..moveTo(0, size.height * 0.3)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height * 0.3)
      ..close();

    canvas.drawPath(pathRoof, paintRoof);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
