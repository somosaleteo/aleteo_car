import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBall extends StatefulWidget {
  const AnimatedBall({super.key});

  @override
  State<AnimatedBall> createState() => _AnimatedBallState();
}

class _AnimatedBallState extends State<AnimatedBall>
    with TickerProviderStateMixin {
  late AnimationController animatedController;
  late AnimationController circleController;

  late Animation<double> ballAnimator;
  late TweenSequence<Offset> animationBall;

  ///
  late Animation<double> scaleAnimator;

  @override
  void initState() {
    super.initState();

    circleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

// ////
    scaleAnimator = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0, // tamaño inicial
          end: 0.9, // tamaño achatado
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.9, // tamaño achatado
          end: 1.0, // tamaño original
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0, // tamaño achatado
          end: 1.0, // tamaño original
        ),
        weight: 7,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0, // tamaño achatado
          end: 0.9, // tamaño original
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0.9, // tamaño achatado
          end: 1.0, // tamaño original
        ),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: Curves.easeInOut,
      ),
    );

// ///
    ballAnimator = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: animatedController,
        curve: const Interval(0.1, 1, curve: Curves.decelerate),
      ),
    );
    animationBall = TweenSequence<Offset>([
      //First fall
      TweenSequenceItem(
        tween: Tween(
          begin: const Offset(-0.4, -0.5),
          end: const Offset(-0.28, 0.4),
        ),
        weight: 1,
      ),
      //First upwards bounce
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(-0.28, 0.4),
            end: const Offset(-0.2, 0),
          ),
          weight: 1),
      // Entry first upwards curve
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(-0.2, 0),
            end: const Offset(-0.13, -0.2),
          ),
          weight: 1),
      //Upper upwards curve
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(-0.13, -0.2),
            end: const Offset(-0.05, -0.27),
          ),
          weight: 1),
      //Upper downwards curve
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(-0.05, -0.27),
            end: const Offset(0.03, -0.2),
          ),
          weight: 1),
      // Exit first upwards curve
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.03, -0.2),
            end: const Offset(0.1, 0),
          ),
          weight: 1),
      //Second fall to floor
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.1, 0),
            end: const Offset(0.2, 0.4),
          ),
          weight: 1),
      //Last updwards bounce
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.2, 0.4),
            end: const Offset(0.26, 0.1),
          ),
          weight: 1),
    ]);

    animatedController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    circleController.dispose();
    animatedController.dispose();
    super.dispose();
  }

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
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        width: 400,
        height: 390,
        child: SlideTransition(
          position: animatedController.drive(animationBall),
          child: Transform.rotate(
            angle: 2 * math.pi,
            child: CustomPaint(
              painter: _AnimatedBallPainter(scaleAnimator.value),
            ),
            //  RotatingCircle(
            //   controller: circleController,
            // ),
          ),
        ),
      ),
    ));
  }
}

class _AnimatedBallPainter extends CustomPainter {
  final double scale;

  _AnimatedBallPainter(this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFee6730)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    var center = Offset(size.width / 2, size.height / 2);
    var radius = size.width / 15;
    var rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawOval(
        Rect.fromLTRB(
          rect.left,
          rect.top,
          rect.right,
          rect.bottom * scale,
        ),
        paint);

    // ...
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
