import 'package:flutter/material.dart';

import '../../../../helpers/responsive_helper.dart';
import '../../main_vehicle_container_widget.dart';
import '../../vehicle_part_widget.dart';
import '../../vehicle_parts/car_bonnets/car_bonnet_custom_painter_widget.dart';
import '../../vehicle_parts/car_cockpicks/car_cockpick_custom_painter_widget.dart';
import '../../vehicle_parts/car_doors/car_door_custom_painter_widget.dart';
import '../../vehicle_parts/car_front_bumpers/car_front_bumber_custom_painter_widget.dart';
import '../../vehicle_parts/car_front_lights/car_front_light_custom_painter_widget.dart';
import '../../vehicle_parts/car_rear_bumpers/car_rear_bumper_custom_painter_widget.dart';
import '../../vehicle_parts/car_rear_lights/car_rear_light_custom_painter_widget.dart';
import '../../vehicle_parts/car_trunks/car_trunk_custom_painter_widget.dart';
import '../../vehicle_parts/car_wheels/car_wheel_custom_painter_widget.dart';
import '../car_bonnet_widget.dart';
import '../cockpick_widget.dart';
import '../doors_widget.dart';
import '../front_bumper_widget.dart';
import '../front_light_widget.dart';
import '../front_wheel_widget.dart';
import '../rear_bumper_widget.dart';
import '../rear_light_widget.dart';
import '../rear_wheel_widget.dart';
import '../trunk_widget.dart';

class CarCustomPainterFiatWidget extends StatelessWidget {
  const CarCustomPainterFiatWidget({
    Key? key,
    required this.size,
    this.showLayoutColors = false,
  }) : super(key: key);
  final Size size;
  final bool showLayoutColors;

  @override
  Widget build(BuildContext context) {
    final wheelSizeTmp = dpPercent(size.width, 19.11);
    final wheelSize = Size(
      wheelSizeTmp,
      wheelSizeTmp,
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
        32,
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
    final leftPositionDoors = dpPercent(size.width, 34);
    final topPositionDoors = dpPercent(size.height, 41.70);
    final leftPositionTrunk = leftPositionDoors + doorsSize.width - 1.0;
    final leftPositionRearBumper = size.width - rearBumperSize.width;
    final leftPositionRearlight = dpPercent(size.width, 93.63);
    final leftPositionFrontlight = dpPercent(size.width, 4.78);
    const leftPositionFrontBumper = 0.0;
    final leftPositionBonnet = dpPercent(size.width, 2.23);
    final topPositionTrunk = topPositionDoors;
    final topPositionBonnet = topPositionDoors;
    final topPositionRearBumper = dpPercent(size.height, 82.96);
    final topPositionFrontBumper = topPositionRearBumper;
    final topPositionRearLight = dpPercent(size.height, 40.81);
    final topPositionFrontLight = dpPercent(size.height, 43.95);
    final leftPositionRearWheel = dpPercent(size.width, 72.29);
    final topPositionWheel = size.height - wheelSize.width;
    final topPositionCockpick = dpPercent(size.height, 1.0);

    const color1 = Color.fromRGBO(23, 121, 108, 1.0),
        color2 = Color.fromRGBO(201, 244, 242, 1.0),
        colorFrontLight = Color.fromRGBO(182, 223, 0, 1.0),
        colorRearLight = Color.fromRGBO(220, 50, 50, 1.0),
        colorBumper = Color.fromRGBO(74, 175, 180, 1.0);

    return MainVehicleContainerWidget(
      size: size,
      color: showLayoutColors ? Colors.yellow : Colors.transparent,
      listOfVehicleParts: [
        CarBonnetWidget(
          left: leftPositionBonnet,
          top: topPositionBonnet,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.blue,
            size: bonnetSize,
            child: const CarBonnetCustomPainterWidget(
              color: color1,
            ),
          ),
        ),
        TrunkWidget(
          left: leftPositionTrunk,
          top: topPositionTrunk,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.blue,
            size: trunkSize,
<<<<<<< HEAD
            child: Opacity(
                opacity: showLayoutColors ? .15 : 1.0,
                child: const CarTrunkCustomPainterWidget(color: color1)),
=======
            child: const CarTrunkAWidget(color: color1),
>>>>>>> cd401e63924708636139c2ede102b605b3fba63a
          ),
        ),
        DoorsWidget(
          left: leftPositionDoors,
          top: topPositionDoors,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.lightBlueAccent,
            size: doorsSize,
            child: const CarDoorsCustomPainterWidget(),
          ),
        ),
        CockpickWidget(
          left: leftPositionCockpick,
          top: topPositionCockpick,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.red,
            size: cockpickSize,
            child: Opacity(
                opacity: showLayoutColors ? .15 : 1.0,
                child: const CarCockpickCustomPainterWidget(color: color2)),
          ),
        ),
        FrontWheelWidget(
          left: leftPositionRearWheel,
          top: topPositionWheel,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.black12,
            size: wheelSize,
            child: Opacity(
                opacity: showLayoutColors ? .15 : 1.0,
                child: const CarWheelCustomPainter()),
          ),
        ),
        RearWheelWidget(
          left: leftPositionWheel,
          top: topPositionWheel,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.black12,
            size: wheelSize,
<<<<<<< HEAD
            child: Opacity(
                opacity: showLayoutColors ? .15 : 1.0,
                child: const CarWheelCustomPainter()),
=======
            child: const CarFrontWheelAWidget(),
>>>>>>> cd401e63924708636139c2ede102b605b3fba63a
          ),
        ),
        RearBumperWidget(
          left: leftPositionRearBumper,
          top: topPositionRearBumper,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.grey,
            size: rearBumperSize,
<<<<<<< HEAD
            child: Opacity(
              opacity: showLayoutColors ? .15 : 1.0,
              child: const CarRearBumperCustomPainterWidget(
                color: colorBumper,
              ),
=======
            child: const CarRearBumperAWidget(
              color: colorBumper,
>>>>>>> cd401e63924708636139c2ede102b605b3fba63a
            ),
          ),
        ),
        FrontBumperWidget(
          left: leftPositionFrontBumper,
          top: topPositionFrontBumper,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.grey,
            size: frontBumperSize,
            child: const CarFrontBumperCustomPainterWidget(color: colorBumper),
          ),
        ),
        RearLightWidget(
          left: leftPositionRearlight,
          top: topPositionRearLight,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.red,
            size: rearLightSize,
<<<<<<< HEAD
            child: Opacity(
              opacity: showLayoutColors ? .15 : 1.0,
              child: const CarRearLightCustomPainterWidget(
                color: colorRearLight,
              ),
=======
            child: const CarRearLightAWidget(
              color: colorRearLight,
>>>>>>> cd401e63924708636139c2ede102b605b3fba63a
            ),
          ),
        ),
        FrontLightWidget(
          left: leftPositionFrontlight,
          top: topPositionFrontLight,
          vehiclePartWidget: VehiclePartWidget(
            showLayout: showLayoutColors,
            color: Colors.yellow,
            size: frontLightSize,
            child: const CarFrontLightCustomPainterWidget(
              color: colorFrontLight,
            ),
          ),
        ),
      ],
    );
  }
}
