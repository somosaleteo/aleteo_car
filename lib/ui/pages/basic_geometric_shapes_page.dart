import 'package:flutter/material.dart';

import '../widgets/my_custom_scaffold_widget.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
        Offset(0, size.height / 2), Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BasicGeometricShapesPage extends StatelessWidget {
  const BasicGeometricShapesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = Size(MediaQuery.of(context).size.width * 0.45,
        MediaQuery.of(context).size.height * 0.45);

    return MyCustomScaffold(
        page: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,

                childAspectRatio: 1.0,
                children: [
                  _TabPrivate(
                    size: size,
                    child: CustomPaint(
                      painter: CirclePainter(),
                    ),
                  ),
                  _TabPrivate(
                    size: size,
                    child: CustomPaint(
                      painter: RectanglePainter(),
                    ),
                  ),
                  _TabPrivate(
                    size: size,
                    child: CustomPaint(
                      painter: TrianglePainter(),
                    ),
                  ),
                  _TabPrivate(
                    size: size,
                    child: CustomPaint(
                      painter: LinePainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        title: "Figuras básicas");
  }
}

class _TabPrivate extends StatelessWidget {
  const _TabPrivate({Key? key, required this.size, required this.child})
      : super(key: key);
  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: child,
        ));
  }
}
