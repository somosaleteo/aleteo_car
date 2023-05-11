import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_cube_faces_design_widget.dart';

class CubeStackFacesWidget extends StatelessWidget {
  const CubeStackFacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0, 0.0),
          child: const CustomCubeFaceDesignWidget(
            color: Color(0xFFE0E0E0),
          )),
      Transform(
          transform: Matrix4.identity()
            ..rotateY(pi / 2)
            ..translate(93.0, 0.0, -93.0),
          alignment: Alignment.center,
          child: const CustomCubeFaceDesignWidget(
            color: Colors.blue,
          )),
      Transform(
          transform: Matrix4.identity()
            ..rotateX(pi / 2)
            ..translate(0.0, -93.0, -93.0),
          alignment: Alignment.center,
          child: const CustomCubeFaceDesignWidget(
            color: Colors.indigo,
          )),
      Transform(
        transform: Matrix4.identity()
          ..rotateX(pi / 2)
          ..translate(0.0, -93.0, 93.0),
        alignment: Alignment.center,
        child: const CustomCubeFaceDesignWidget(
          color: Color(0xFFB3E5FC),
        ),
      ),
      Transform(
        transform: Matrix4.identity()
          ..rotateY(pi / 2)
          ..translate(93.0, 0.0, 93.0),
        alignment: Alignment.center,
        child: const CustomCubeFaceDesignWidget(
          color: Color(0xFFC5CAE9),
        ),
      ),
      Transform(
        transform: Matrix4.identity()..translate(.0, 0.0, -186.0),
        alignment: Alignment.center,
        child: const CustomCubeFaceDesignWidget(
          color: Color(0xFFB39DDB),
        ),
      ),
    ]);
  }
}
