import 'package:flutter/material.dart';

import '../widgets/ball/animated_ball_widget.dart';

class AnimatedBallPage extends StatelessWidget {
  const AnimatedBallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelota animada'),
      ),
      body: AnimatedBall(),
    );
  }
}
