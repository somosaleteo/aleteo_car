import '../positioned_vehicle_part_widget.dart';
import '../vehicle_part_widget.dart';

class CarBonnetWidget extends PositionedVehiclePartWidget {
  const CarBonnetWidget({
    super.key,
    required double left,
    required double top,
    required VehiclePartWidget vehiclePartWidget,
  }) : super(
          left: left,
          top: top,
          vehiclePartWidget: vehiclePartWidget,
        );
}
