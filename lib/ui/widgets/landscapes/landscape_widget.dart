import 'dart:math';
import 'dart:ui' as ui;

import 'package:aleteo_car/ui/widgets/landscapes/tree_widget.dart';
import 'package:flutter/material.dart';

import '../../../helpers/responsive_helper.dart';
import '../cars/car_types/car_custom_painter_fiat_widget.dart';
import 'building_widget.dart';
import 'clouds_widget.dart';
import 'house_widget.dart';
import 'street_widget.dart';

class LandscapeWidget extends StatefulWidget {
  const LandscapeWidget({super.key});

  @override
  State<LandscapeWidget> createState() => _LandscapeWidgetState();
}

class _LandscapeWidgetState extends State<LandscapeWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> rotate;
  late Animation<Offset> carTranslation;
  late Animation<Offset> cloudsTranslation;
  late AnimationController animationController;
  late Animation<Offset> objectsTranslation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    rotate = Tween<double>(begin: 0, end: -1).animate(animationController);

    carTranslation = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(-1, 0),
    ).animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
    cloudsTranslation = Tween<Offset>(
      begin: const Offset(-1.6, -3),
      end: const Offset(1, 8),
    ).animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
    objectsTranslation = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: const Offset(1, 0),
    ).animate(animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
    animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tmp = dpFromSize(MediaQuery.of(context).size, 380, true);
    final Size size = Size(tmp * 1.25, tmp);

    double sunSize = 70;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Column(
        children: [
          RotationTransition(
            turns: rotate,
            child: SizedBox(
              width: sunSize,
              height: sunSize,
              child: CustomPaint(
                  painter: SunEffectPainter(
                      screenWidth: MediaQuery.of(context).size.width),
                  child: Container(
                    width: sunSize,
                    height: sunSize,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  )),
            ),
          ),
          SlideTransition(
            position: cloudsTranslation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CloudsWidget(),
                CloudsWidget(),
                CloudsWidget(),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Stack(
            children: [
              SlideTransition(
                position: objectsTranslation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    TreeWidget(
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    BuildingWidget(
                      height: 300,
                      width: 200,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    TreeWidget(
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    HouseWidget(
                      height: 150,
                      width: 130,
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    TreeWidget(
                      height: 200,
                      width: 200,
                    ),
                  ],
                ),
              ),
              SlideTransition(
                position: carTranslation,
                child: CarCustomPainterFiatWidget(
                  size: size,
                  showLayoutColors: false,
                ),
              ),
            ],
          ),
          const StreetWidget(),
        ],
      ),
    );
  }
}

class SunEffectPainter extends CustomPainter {
  final double screenWidth;
  final double totalEffectShine = 20;

  SunEffectPainter({required this.screenWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(size.width / 2, size.height / 2);
    double radiusArcShape = screenWidth;

    List<Color> colors = [
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0)
    ];
    Paint paint = Paint()
      ..shader = ui.Gradient.radial(
        offset,
        radiusArcShape,
        colors,
      );

    double radius = (1 * pi) / totalEffectShine;

    for (var i = 0; i < totalEffectShine; i++) {
      canvas.drawPath(
        drawPieShape(radiusArcShape, radius * (i * 2), radius, size, offset),
        paint,
      );
    }
  }

  Path drawPieShape(double radiusArchShape, double d, double radius, Size size,
      Offset offset) {
    return Path()
      ..moveTo(offset.dx, offset.dy)
      ..arcTo(Rect.fromCircle(center: offset, radius: radiusArchShape), d,
          radius, false)
      ..close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
