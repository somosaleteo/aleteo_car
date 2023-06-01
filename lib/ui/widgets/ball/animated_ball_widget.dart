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
  late TweenSequence<Offset> animationBall;

  late AnimationController circleController;

  @override
  void initState() {
    super.initState();

    circleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

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
      // Entry first upwards curve
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
            end: const Offset(0.3, 0.1),
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
            child: RotatingCircleTry(
              controller: circleController,
            ),
          ),
        ),
      ),
    );
  }
}

class RotatingCircleTry extends AnimatedWidget {
  const RotatingCircleTry({super.key, required AnimationController controller})
      : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 9 * math.pi,
      child: CustomPaint(
        painter: _AnimatedBallPainter(),
      ),
    );
  }
}

class _AnimatedBallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFee6730)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 15, paint);

    final blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    path.moveTo(size.width / 2, size.height / 2.3);
    path.lineTo(size.width / 2, size.height / 1.77);

    canvas.drawPath(path, blackPaint);

    path.reset();
    path.moveTo(size.width / 2.3, size.height / 2);
    path.lineTo(size.width / 1.77, size.height / 2);

    canvas.drawPath(path, blackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
