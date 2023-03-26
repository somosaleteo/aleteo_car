import 'package:flutter/material.dart';

import '../positioned_vehicle_part_widget.dart';
import '../vehicle_part_widget.dart';

class DoorsWidget extends PositionedVehiclePartWidget {
  const DoorsWidget(
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
}
