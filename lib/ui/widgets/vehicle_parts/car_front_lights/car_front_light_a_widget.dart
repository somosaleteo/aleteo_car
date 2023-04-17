import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarFrontLightAWidget extends StatelessWidget with EntityFrontLight {
  const CarFrontLightAWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        final tmpRadius = Radius.circular(p1.biggest.height);
        return Container(
          decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(225, 0, 0, 1.0),
            borderRadius: BorderRadius.only(
              topLeft: tmpRadius,
            ),
          ),
        );
      },
    );
  }
}
