import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarFrontBumperAWidget extends StatelessWidget with EntityFrontBumper {
  const CarFrontBumperAWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        final tmpRadius = Radius.circular(p1.biggest.height);
        return Container(
          decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(125, 125, 125, 1.0),
            borderRadius: BorderRadius.only(
              bottomLeft: tmpRadius,
            ),
          ),
        );
      },
    );
  }
}
