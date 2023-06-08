import 'package:aleteo_car/ui/widgets/cars/car_bonnet_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/car_types/car_custom_fiat_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/cockpit_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/doors_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/front_bumper_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/front_light_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/front_wheel_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/rear_bumper_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/rear_light_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/rear_wheel_widget.dart';
import 'package:aleteo_car/ui/widgets/cars/trunk_widget.dart';
import 'package:aleteo_car/ui/widgets/main_vehicle_container_widget.dart';
import 'package:aleteo_car/ui/widgets/positioned_vehicle_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test CarCustomFiatWidget', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarCustomFiatWidget(
        size: Size(100, 100),
      ),
    ));

    expect(find.byType(MainVehicleContainerWidget), findsOneWidget);
    expect(find.bySubtype<PositionedVehiclePartWidget>(), findsNWidgets(10));

    expect(find.byType(CarBonnetWidget), findsOneWidget);
    expect(find.byType(TrunkWidget), findsOneWidget);
    expect(find.byType(DoorsWidget), findsOneWidget);
    expect(find.byType(CockpitWidget), findsOneWidget);
    expect(find.byType(FrontWheelWidget), findsOneWidget);
    expect(find.byType(RearWheelWidget), findsOneWidget);
    expect(find.byType(RearBumperWidget), findsOneWidget);
    expect(find.byType(FrontBumperWidget), findsOneWidget);
    expect(find.byType(RearLightWidget), findsOneWidget);
    expect(find.byType(FrontLightWidget), findsOneWidget);
  });
}
