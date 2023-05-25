import 'package:flutter/material.dart';

class AnimatedBall extends StatefulWidget {
  const AnimatedBall({super.key});

  @override
  State<AnimatedBall> createState() => _AnimatedBallState();
}

class _AnimatedBallState extends State<AnimatedBall>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late TweenSequence<Offset> animationBall;

  @override
  void initState() {
    super.initState();

    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    animationBall = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween(
            begin: Offset.zero,
            end: const Offset(0.1, 0.25),
          ),
          weight: 2.5),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.1, 0.25),
            end: const Offset(0.201, 0.49),
          ),
          weight: 2.5),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.201, 0.49),
            end: const Offset(0.3, 0.75),
          ),
          weight: 2.5),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.3, 0.75),
            end: const Offset(0.44, 0.515),
          ),
          weight: 3.75),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.44, 0.515),
            end: const Offset(0.55, 0.35),
          ),
          weight: 4.25),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.55, 0.35),
            end: const Offset(0.68, 0.53),
          ),
          weight: 5.5),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.68, 0.53),
            end: const Offset(0.79, 0.715),
          ),
          weight: 5.0),
    ]);

    animatedController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
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
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          width: 400,
          height: 280,
          child: SlideTransition(
            position: animatedController.drive(animationBall),
            child: CustomPaint(
              painter: _AnimatedBallPainter(),
            ),
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
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 9, size.height / 9), size.width / 18, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
