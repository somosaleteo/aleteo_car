import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  BouncingBallAnimationState createState() => BouncingBallAnimationState();
}

class BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation<double> ballAnimation;
  late double containerWidth;
  late double containerHeight;
  double ballSize = 50.0;
  double ballPositionX = 0.0;
  double ballPositionY = 0.0;
  double ballVelocityX = 2.0;
  double ballVelocityY = 2.0;

  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    )..repeat();

    ballAnimation = Tween<double>(begin: 0, end: 1).animate(animatedController)
      ..addListener(() {
        updateBallPosition();
      });
  }

  @override
  void dispose() {
    animatedController.dispose();
    super.dispose();
  }

  void updateBallPosition() {
    setState(() {
      ballPositionX += ballVelocityX;
      ballPositionY += ballVelocityY;

      if (ballPositionX + ballSize >= containerWidth || ballPositionX <= 0) {
        ballVelocityX = -ballVelocityX;
      }

      if (ballPositionY + ballSize >= containerHeight || ballPositionY <= 0) {
        ballVelocityY = -ballVelocityY;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebote pelota'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          containerWidth = constraints.maxWidth;
          containerHeight = constraints.maxHeight;

          return CustomPaint(
            painter: BallPainter(
              ballPositionX: ballPositionX,
              ballPositionY: ballPositionY,
              ballSize: ballSize,
            ),
            size: Size(containerWidth, containerHeight),
          );
        },
      ),
    );
  }
}

class BallPainter extends CustomPainter {
  final double ballPositionX;
  final double ballPositionY;
  final double ballSize;

  BallPainter({
    required this.ballPositionX,
    required this.ballPositionY,
    required this.ballSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final ballPaint = Paint()..color = Colors.blue;
    final ballRect = Rect.fromLTWH(
      ballPositionX,
      ballPositionY,
      ballSize,
      ballSize,
    );

    canvas.drawOval(ballRect, ballPaint);
  }

  @override
  bool shouldRepaint(BallPainter oldDelegate) => true;
}
