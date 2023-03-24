import 'package:aleteo_car/helpers/responsive_helper.dart';
import 'package:aleteo_car/ui/widgets/cars/rear_wheel_widget.dart';
import 'package:aleteo_car/ui/widgets/main_vehicle_container_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';
import 'package:flutter/material.dart';

class CarMainContainerWidget extends StatelessWidget {
  const CarMainContainerWidget({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    double tmp = dpFromSize(size, 100, true);
    final wheelSize = Size(tmp, tmp);
    final leftPositionWheel = dpFromSize(size, 30, true);
    final topPositionWheel = size.height - wheelSize.width;
    return MainVehicleContainerWidget(
      size: size,
      listOfVehicleParts: [
        /*
        CarBonnetWidget(
          left: 0.0,
          top: 0.0,
          vehiclePartWidget: VehiclePartWidget(
            size: Size.zero,
            child: SizedBox.shrink(),
          ),
        ),
        TrunkWidget(
          left: 0.0,
          top: 0.0,
          vehiclePartWidget: VehiclePartWidget(
            size: Size.zero,
            child: SizedBox.shrink(),
          ),
        ),
        DoorsWidget(
          left: 0.0,
          top: 0.0,
          vehiclePartWidget: VehiclePartWidget(
            size: Size.zero,
            child: SizedBox.shrink(),
          ),
        ),
        CockpickWidget(
          left: 0.0,
          top: 0.0,
          vehiclePartWidget: VehiclePartWidget(
            size: Size.zero,
            child: SizedBox.shrink(),
          ),
        ),
        FrontWheelWidget(
          left: 0.0,
          top: 0.0,
          vehiclePartWidget: VehiclePartWidget(
            size: Size.zero,
            child: SizedBox.shrink(),
          ),
        ),*/
        RearWheelWidget(
          left: leftPositionWheel,
          top: topPositionWheel,
          vehiclePartWidget: VehiclePartWidget(
            size: wheelSize,
            child: Text(
              wheelSize.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
