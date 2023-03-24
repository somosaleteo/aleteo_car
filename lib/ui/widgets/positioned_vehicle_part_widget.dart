import 'package:flutter/material.dart';

import 'vehicle_part_widget.dart';

class PositionedVehiclePartWidget extends StatelessWidget {
  const PositionedVehiclePartWidget(
      {Key? key,
      required this.vehiclePartWidget,
      required this.top,
      required this.left})
      : super(key: key);
  final VehiclePartWidget vehiclePartWidget;
  final double top, left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: vehiclePartWidget,
    );
  }
}
