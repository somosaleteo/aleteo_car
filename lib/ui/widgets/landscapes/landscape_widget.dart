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
  late AnimationController animatedController;
  late Animation<Color?> sunColorTweenAnimation;
  late Animation<Color?> sunRaysColorTweenAnimation;
  late Animation<Color?> landscapeColorTweenAnimation;
  late Animation<double> sunRotateAnimation;
  late Animation<double> sizeAnimation;
  late Animation<Offset> cloudsTranslation;
  late Animation<Offset> objectsTranslation;
  late Animation<Offset> carTranslation;
  Color currentColor = Colors.blueAccent;
  double currentAngle = 0.0;

  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 20,
      ),
    );
    //Sun Color Change Animation
    sunColorTweenAnimation = ColorTween(
      begin: Colors.yellow,
      end: Colors.white,
    ).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: const Interval(0, 1),
      ),
    );
    //Sun Rays Effect Color Change Animation
    sunRaysColorTweenAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.2),
      end: Colors.white.withOpacity(0.0),
    ).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: const Interval(0, 0.5),
      ),
    );
    //Landscape Effect Color Change Animation
    landscapeColorTweenAnimation = ColorTween(
      begin: Colors.blue[300],
      end: Colors.grey.shade900,
    ).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: const Interval(0, 0.8),
      ),
    );
    //Sun Rotation Animation
    sunRotateAnimation = Tween<double>(
      begin: 0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: const Interval(0, 0.5),
      ),
    );
    //Sun Size Change Animation
    sizeAnimation = Tween<double>(
      begin: 90,
      end: 50,
    ).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: const Interval(0, 0.4),
      ),
    );
    //Clouds Translation Animation
    cloudsTranslation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(1, 0),
    ).animate(animatedController)
      ..addListener(() {
        setState(() {});
      });
    //Objects Translation Animation
    objectsTranslation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(1, 0),
    ).animate(animatedController)
      ..addListener(() {
        setState(() {});
      });
    //Car Translation Animation
    carTranslation = Tween<Offset>(
      begin: const Offset(2, 0.72),
      end: const Offset(-1.35, 0.72),
    ).animate(animatedController)
      ..addListener(() {
        setState(() {});
      });
    animatedController.repeat(reverse: false);
    animatedController.addListener(
      () {
        setState(
          () {
            currentColor = sunColorTweenAnimation.value!;
            currentAngle = sunRotateAnimation.value;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tmp = dpFromSize(MediaQuery.of(context).size, 380, true);
    final Size size = Size(tmp * 1.25, tmp);

    final Color landscapeColor = landscapeColorTweenAnimation.value!;
    final double sunSize = sizeAnimation.value;

    return Scaffold(
      backgroundColor: landscapeColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text('¿Y si viajamos?'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Transform.rotate(
              angle: sunRotateAnimation.value,
              child: CustomPaint(
                painter: SunEffectPainter(
                    screenWidth: MediaQuery.of(context).size.width,
                    sunRayColor: sunRaysColorTweenAnimation.value!),
                child: Container(
                  width: sunSize,
                  height: sunSize,
                  decoration: BoxDecoration(
                    color: sunColorTweenAnimation.value,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: SlideTransition(
              position: cloudsTranslation,
              child: const SizedBox(
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CloudsWidget(),
                    CloudsWidget(),
                    CloudsWidget(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          Stack(
            children: [
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: SlideTransition(
                  position: objectsTranslation,
                  child: const Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      TreeWidget(),
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
                      TreeWidget(),
                      SizedBox(
                        width: 70,
                      ),
                      HouseWidget(),
                      SizedBox(
                        width: 80,
                      ),
                      TreeWidget(),
                      SizedBox(
                        width: 80,
                      )
                    ],
                  ),
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
          const Expanded(
            child: StreetWidget(),
          ),
        ],
      ),
    );
  }
}

class SunEffectPainter extends CustomPainter {
  final double screenWidth;
  final Color sunRayColor;
  final double totalEffectShine = 20;

  SunEffectPainter({
    required this.screenWidth,
    required this.sunRayColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(size.width / 2, size.height / 2);
    double radiusArcShape = screenWidth;

    List<Color> colors = [
      sunRayColor,
      Colors.white.withOpacity(0),
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
