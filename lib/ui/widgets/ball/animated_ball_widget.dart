import 'package:flutter/material.dart';

class AnimatedBall extends StatefulWidget {
  const AnimatedBall({super.key});

  @override
  State<AnimatedBall> createState() => _AnimatedBallState();
}

class _AnimatedBallState extends State<AnimatedBall>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation<Offset> animatedBall;

  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    //Animated Ball KeyFrame 1
    animatedBall = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(2, 1),
    ).animate(animatedController)
      ..addListener(() {
        setState(() {});
      });
    animatedController.repeat(reverse: false);
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
            position: animatedBall,
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
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 9, size.height / 9), size.width / 18, paint);

    final paintKeyFrames = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 4.8, size.height / 2.8),
        size.width / 18, paintKeyFrames);

    canvas.drawCircle(Offset(size.width / 3.3, size.height / 1.7),
        size.width / 18, paintKeyFrames);

    canvas.drawCircle(Offset(size.width / 2.5, size.height / 1.2),
        size.width / 18, paintKeyFrames);

    canvas.drawCircle(Offset(size.width / 1.85, size.height / 1.57),
        size.width / 18, paintKeyFrames);

    canvas.drawCircle(Offset(size.width / 1.5, size.height / 2.3),
        size.width / 18, paintKeyFrames);

    canvas.drawCircle(Offset(size.width / 1.27, size.height / 1.64),
        size.width / 18, paintKeyFrames);

    canvas.drawCircle(Offset(size.width / 1.12, size.height / 1.25),
        size.width / 18, paintKeyFrames);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
