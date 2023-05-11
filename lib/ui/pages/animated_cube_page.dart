import 'package:flutter/material.dart';

import '../widgets/cube/cube_transform_widget.dart';
import '../widgets/my_custom_scaffold_widget.dart';

class AnimatedCubePage extends StatelessWidget {
  const AnimatedCubePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarColor: Colors.transparent,
      appBarShadow: 0,
      title: '¡Probemos 3 dimensiones!',
      color: Colors.blue[300],
      page: const CubeTransformWidget(),
    );
  }
}
