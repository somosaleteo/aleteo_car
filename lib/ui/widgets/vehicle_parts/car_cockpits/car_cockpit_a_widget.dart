import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarCockpitAWidget extends StatelessWidget with EntityCockpick {
  const CarCockpitAWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        final tmp = Radius.circular(p1.maxWidth * 0.5);
        return Container(
          decoration: BoxDecoration(
              color: color ?? const Color.fromRGBO(3, 221, 208, 1.0),
              borderRadius: BorderRadius.only(topLeft: tmp, topRight: tmp)),
        );
      },
    );
  }
}
