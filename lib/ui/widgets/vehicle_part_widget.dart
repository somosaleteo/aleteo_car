import 'package:flutter/material.dart';

class VehiclePartWidget extends StatelessWidget {
  const VehiclePartWidget({Key? key, required this.size, required this.child})
      : super(key: key);

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: size.width,
      height: size.height,
      child: child,
    );
  }
}
