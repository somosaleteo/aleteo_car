import '../positioned_vehicle_part_widget.dart';
import '../vehicle_part_widget.dart';

class CockpitWidget extends PositionedVehiclePartWidget {
  const CockpitWidget(
      {super.key,
      required double left,
      required double top,
      required VehiclePartWidget vehiclePartWidget})
      : super(
          left: left,
          top: top,
          vehiclePartWidget: vehiclePartWidget,
        );
}
