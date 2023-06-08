import 'package:aleteo_car/helpers/responsive_helper.dart';

import 'package:aleteo_car/ui/widgets/cars/doors_widget.dart';
import 'package:aleteo_car/ui/widgets/positioned_vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';

import 'package:aleteo_car/ui/widgets/vehicle_parts/car_doors/car_door_a_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test DoorsWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Stack(children: [
        DoorsWidget(
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
            child: const CarDoorsAWidget(
              color: Colors.black,
            ),
          ),
        ),
      ]),
    ));
    final widget = tester.widget<DoorsWidget>(find.byType(DoorsWidget));
    expect(find.byType(VehiclePartWidget), findsOneWidget);
    expect(widget, isA<PositionedVehiclePartWidget>());
    expect(widget.left, 2.23);
    expect(widget.top, 41.7);
  });
}
