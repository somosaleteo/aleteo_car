import 'package:aleteo_car/ui/widgets/positioned_vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';
import 'package:aleteo_car/ui/widgets/vehicle_parts/car_wheels/car_wheel_a_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test PositionedVehiclePartWidget', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Stack(children: [
        PositionedVehiclePartWidget(
          left: 100.0,
          top: 100.0,
          vehiclePartWidget: VehiclePartWidget(
            color: Colors.blue,
            size: Size(70, 70),
            child: CarFrontWheelAWidget(
              color: Colors.black,
            ),
          ),
        ),
      ]),
    ));

    expect(find.byType(VehiclePartWidget), findsOneWidget);
    expect(find.byType(CarFrontWheelAWidget), findsOneWidget);
  });
}
