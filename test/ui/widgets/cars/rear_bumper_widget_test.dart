import 'package:aleteo_car/helpers/responsive_helper.dart';

import 'package:aleteo_car/ui/widgets/cars/rear_bumper_widget.dart';
import 'package:aleteo_car/ui/widgets/positioned_vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_parts/car_rear_bumpers/car_rear_bumper_a_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test FrontBumperWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Stack(children: [
        RearBumperWidget(
          left: dpPercent(100, 2.23),
          top: dpPercent(100, 41.70),
          vehiclePartWidget: VehiclePartWidget(
            showLayout: false,
            color: Colors.blue,
            size: Size(
              dpPercent(
                100,
                32,
              ),
              dpPercent(100, 44.84),
            ),
            child: const CarRearBumperAWidget(
              color: Colors.grey,
            ),
          ),
        ),
      ]),
    ));
    final widget =
        tester.widget<RearBumperWidget>(find.byType(RearBumperWidget));
    expect(find.byType(VehiclePartWidget), findsOneWidget);
    expect(widget, isA<PositionedVehiclePartWidget>());
    expect(widget.left, 2.23);
    expect(widget.top, 41.7);
  });
}
