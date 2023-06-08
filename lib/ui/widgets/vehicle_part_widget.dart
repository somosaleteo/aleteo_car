import 'package:flutter/material.dart';

class VehiclePartWidget extends StatelessWidget {
  const VehiclePartWidget(
      {super.key,
      required this.size,
      required this.child,
      this.color = Colors.transparent,
      this.showLayout = false});

  final Size size;
  final Widget child;
  final Color color;
  final bool showLayout;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: showLayout ? color : Colors.transparent,
      width: size.width,
      height: size.height,
      child: Opacity(opacity: showLayout ? .1 : 1.0, child: child),
    );
  }
}
