import 'package:flutter/material.dart';

class VehiclePartWidget extends StatelessWidget {
  const VehiclePartWidget({
    Key? key,
    required this.size,
    required this.child,
    this.color = Colors.transparent,
  }) : super(key: key);

  final Size size;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: size.width,
      height: size.height,
      child: child,
    );
  }
}
