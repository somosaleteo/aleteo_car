import 'package:aleteo_car/helpers/responsive_helper.dart';

import 'package:aleteo_car/ui/widgets/cars/front_bumper_widget.dart';
import 'package:aleteo_car/ui/widgets/positioned_vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';

import 'package:aleteo_car/ui/widgets/vehicle_parts/car_front_bumpers/car_front_bumber_a_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test FrontBumperWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Stack(children: [
        FrontBumperWidget(
          left: dpPercent(100, 2.23),
          top: dpPercent(100, 41.70),
          vehiclePartWidget: VehiclePartWidget(
            showLayout: false,
            color: Colors.red,
            size: Size(
              dpPercent(
                100,
                32,
              ),
              dpPercent(100, 44.84),
            ),
            child: const CarFrontBumperAWidget(
              color: Colors.black,
            ),
          ),
        ),
      ]),
    ));
    final widget =
        tester.widget<FrontBumperWidget>(find.byType(FrontBumperWidget));
    expect(find.byType(VehiclePartWidget), findsOneWidget);
    expect(widget, isA<PositionedVehiclePartWidget>());
    expect(widget.left, 2.23);
    expect(widget.top, 41.7);
  });
}
