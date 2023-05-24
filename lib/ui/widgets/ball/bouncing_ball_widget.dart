import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  BouncingBallAnimationState createState() => BouncingBallAnimationState();
}

class BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double ballSize = 50.0;
  double ballPositionX = 0.0; // Asigna un valor inicial
  double ballPositionY = 0.0; // Asigna un valor inicial
  double ballVelocityX = 2.0;
  double ballVelocityY = 2.0;
  late double containerWidth;
  late double containerHeight;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        updateBallPosition();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
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
