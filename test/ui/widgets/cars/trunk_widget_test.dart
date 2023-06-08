import 'package:aleteo_car/helpers/responsive_helper.dart';

import 'package:aleteo_car/ui/widgets/cars/trunk_widget.dart';
import 'package:aleteo_car/ui/widgets/positioned_vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_parts/car_trunks/car_trunk_a.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test FrontBumperWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Stack(children: [
        TrunkWidget(
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
            child: const CarTrunkAWidget(
              color: Colors.grey,
            ),
          ),
        ),
      ]),
    ));
    final widget = tester.widget<TrunkWidget>(find.byType(TrunkWidget));
    expect(find.byType(VehiclePartWidget), findsOneWidget);
    expect(widget, isA<PositionedVehiclePartWidget>());
    expect(widget.left, 2.23);
    expect(widget.top, 41.7);
  });
}
