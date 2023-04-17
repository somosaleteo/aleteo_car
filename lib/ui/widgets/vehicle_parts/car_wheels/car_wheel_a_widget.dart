import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarFrontWheelAWidget extends StatelessWidget
    with EntityFrontWheel, EntityRearWheel {
  const CarFrontWheelAWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        final tmpRadius = Radius.circular(p1.biggest.height * 0.5);
        return Container(
          decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(0, 0, 0, 1.0),
            borderRadius: BorderRadius.all(
              tmpRadius,
            ),
          ),
        );
      },
    );
  }
}
