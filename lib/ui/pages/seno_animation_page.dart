import 'package:flutter/material.dart';

import '../widgets/animated_widgets/circle_animation_widget.dart';
import '../widgets/my_custom_scaffold_widget.dart';

class SinAnimationPage extends StatelessWidget {
  const SinAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyCustomScaffold(
      title: 'Animación de ejemplo del Seno',
      page: Center(
        child: CircleAnimationWidget(),
      ),
    );
  }
}
