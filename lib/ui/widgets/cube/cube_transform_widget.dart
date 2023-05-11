import 'package:flutter/material.dart';

import 'cube_stack_faces_widget.dart';

class CubeTransformWidget extends StatefulWidget {
  const CubeTransformWidget({super.key});

  @override
  State<CubeTransformWidget> createState() => _CubeTransformWidgetState();
}

class _CubeTransformWidgetState extends State<CubeTransformWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController cubeAnimationController;
  Matrix4 transformationMatrix = Matrix4.identity();
  @override
  void initState() {
    super.initState();
    cubeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    final Animation<double> animation =
        Tween(begin: 0.0, end: 125.66).animate(cubeAnimationController);
    animation.addListener(() {
      setState(() {
        transformationMatrix = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(animation.value)
          ..rotateY(animation.value);
      });
    });

    cubeAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    cubeAnimationController.dispose();
    super.dispose();
  }

  Offset offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Transform(
          transform: transformationMatrix,
          alignment: Alignment.center,
          child: const Center(
            child: CubeStackFacesWidget(),
          ),
        ),
      ),
    );
  }
}
