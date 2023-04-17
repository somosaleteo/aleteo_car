import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarTrunkAWidget extends StatelessWidget with EntityTrunk {
  const CarTrunkAWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        final tmpRadius = Radius.circular(p1.biggest.width * 0.15);
        return Container(
          decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(3, 221, 208, 1.0),
            borderRadius: BorderRadius.only(
              topRight: tmpRadius,
            ),
          ),
        );
      },
    );
  }
}
