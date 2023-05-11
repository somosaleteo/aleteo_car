import 'package:aleteo_car/ui/widgets/cube/cube_transform_widget.dart';
import 'package:flutter/material.dart';

class AnimatedCubePage extends StatelessWidget {
  const AnimatedCubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        title: const Text('¡Probemos 3 dimensiones!'),
      ),
      body: const CubeTransformWidget(),
    );
  }
}
