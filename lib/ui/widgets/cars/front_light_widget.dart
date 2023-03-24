import 'package:flutter/material.dart';

import '../positioned_vehicle_part_widget.dart';
import '../vehicle_part_widget.dart';

class FrontLightWidget extends PositionedVehiclePartWidget {
  const FrontLightWidget(
      {Key? key,
      required double left,
      required double top,
      required VehiclePartWidget vehiclePartWidget})
      : super(
          key: key,
          left: left,
          top: top,
          vehiclePartWidget: vehiclePartWidget,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
