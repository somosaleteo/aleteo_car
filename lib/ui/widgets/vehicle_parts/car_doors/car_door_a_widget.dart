import 'package:flutter/material.dart';

import '../../../../entities.dart';

class CarDoorsAWidget extends StatelessWidget with EntityTrunk {
  const CarDoorsAWidget({Key? key, this.color}) : super(key: key);

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Container(
          decoration: BoxDecoration(
            color: color ?? const Color.fromRGBO(3, 221, 208, 1.0),
          ),
        );
      },
    );
  }
}
