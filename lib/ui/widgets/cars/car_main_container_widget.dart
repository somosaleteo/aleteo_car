import 'package:flutter/material.dart';

import '../../../helpers/responsive_helper.dart';
import '../main_vehicle_container_widget.dart';
import '../vehicle_part_widget.dart';
import 'car_bonnet_widget.dart';
import 'cockpick_widget.dart';
import 'doors_widget.dart';
import 'front_bumper_widget.dart';
import 'front_light_widget.dart';
import 'front_wheel_widget.dart';
import 'rear_bumper_widget.dart';
import 'rear_light_widget.dart';
import 'rear_wheel_widget.dart';
import 'trunk_widget.dart';

class CarMainContainerWidget extends StatelessWidget {
  const CarMainContainerWidget({
    Key? key,
    required this.size,
    this.showLayoutColors = false,
  }) : super(key: key);
  final Size size;
  final bool showLayoutColors;

  @override
  Widget build(BuildContext context) {
    final wheelSize = Size(
      dpPercent(size.width, 19.11),
      dpPercent(size.width, 26.91),
    );
    final cockpickSize = Size(
      dpPercent(
        size.width,
        60,
      ),
      dpPercent(size.height, 45),
    );
    final doorsSize = Size(
      dpPercent(
        size.width,
        31.85,
      ),
      dpPercent(size.height, 44.84),
    );
    final rearBumperSize = Size(
      dpPercent(
        size.width,
        4.78,
      ),
      dpPercent(size.height, 6.73),
    );
    final frontBumperSize = rearBumperSize;
    final rearLightSize = rearBumperSize;
    final frontLightSize = rearBumperSize;
    final trunkSize = doorsSize;
    final bonnetSize = doorsSize;
    final leftPositionWheel = dpPercent(size.width, 8.60);
    final leftPositionCockpick = dpPercent(size.width, 25);
    final leftPositionDoors = dpPercent(size.width, 34.08);
    final topPositionDoors = dpPercent(size.height, 41.70);
    final leftPositionTrunk = dpPercent(size.width, 2.23);
    final leftPositionRearBumper = size.width - rearBumperSize.width;
    final leftPositionRearlight = dpPercent(size.width, 93.63);
    final leftPositionFrontlight = dpPercent(size.width, 4.78);
    const leftPositionFrontBumper = 0.0;
    final leftPositionBonnet = leftPositionDoors + doorsSize.width;
    final topPositionTrunk = topPositionDoors;
    final topPositionBonnet = topPositionDoors;
    final topPositionRearBumper = dpPercent(size.height, 82.96);
    final topPositionFrontBumper = topPositionRearBumper;
    final topPositionRearLight = dpPercent(size.height, 40.81);
    final topPositionFrontLight = dpPercent(size.height, 43.95);
    final leftPositionRearWheel = dpPercent(size.width, 72.29);
    final topPositionWheel = size.height - wheelSize.width;
    final topPositionCockpick = dpPercent(size.height, 1.0);

    return MainVehicleContainerWidget(
      size: size,
      color: showLayoutColors ? Colors.yellow : Colors.transparent,
      listOfVehicleParts: [
        CarBonnetWidget(
          left: leftPositionBonnet,
          top: topPositionBonnet,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.blue : Colors.transparent,
            size: bonnetSize,
            child: const SizedBox.shrink(),
          ),
        ),
        TrunkWidget(
          left: leftPositionTrunk,
          top: topPositionTrunk,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.blue : Colors.transparent,
            size: trunkSize,
            child: const SizedBox.shrink(),
          ),
        ),
        DoorsWidget(
          left: leftPositionDoors,
          top: topPositionDoors,
          vehiclePartWidget: VehiclePartWidget(
            color:
                showLayoutColors ? Colors.lightBlueAccent : Colors.transparent,
            size: doorsSize,
            child: const SizedBox.shrink(),
          ),
        ),
        CockpickWidget(
          left: leftPositionCockpick,
          top: topPositionCockpick,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.red : Colors.transparent,
            size: cockpickSize,
            child: const SizedBox.shrink(),
          ),
        ),
        FrontWheelWidget(
          left: leftPositionRearWheel,
          top: topPositionWheel,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.black12 : Colors.transparent,
            size: wheelSize,
            child: const SizedBox.shrink(),
          ),
        ),
        RearWheelWidget(
          left: leftPositionWheel,
          top: topPositionWheel,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.black12 : Colors.transparent,
            size: wheelSize,
            child: Center(
              child: Text(
                wheelSize.toString(),
              ),
            ),
          ),
        ),
        RearBumperWidget(
          left: leftPositionRearBumper,
          top: topPositionRearBumper,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.grey : Colors.transparent,
            size: rearBumperSize,
            child: const SizedBox.shrink(),
          ),
        ),
        FrontBumperWidget(
          left: leftPositionFrontBumper,
          top: topPositionFrontBumper,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.grey : Colors.transparent,
            size: frontBumperSize,
            child: const SizedBox.shrink(),
          ),
        ),
        RearLightWidget(
          left: leftPositionRearlight,
          top: topPositionRearLight,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.red : Colors.transparent,
            size: rearLightSize,
            child: const SizedBox.shrink(),
          ),
        ),
        FrontLightWidget(
          left: leftPositionFrontlight,
          top: topPositionFrontLight,
          vehiclePartWidget: VehiclePartWidget(
            color: showLayoutColors ? Colors.yellow : Colors.transparent,
            size: frontLightSize,
            child: const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
