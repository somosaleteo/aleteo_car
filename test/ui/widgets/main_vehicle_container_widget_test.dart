import 'package:aleteo_car/ui/widgets/main_vehicle_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MainVehicleContainerWidget', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MainVehicleContainerWidget(
        listOfVehicleParts: [],
        size: Size(100, 100),
        color: Colors.blue,
      ),
    ));
    final widget = tester.widget<MainVehicleContainerWidget>(
        find.byType(MainVehicleContainerWidget));
    expect(widget.color, Colors.blue);
    expect(widget.size, const Size(100, 100));
    expect(widget.listOfVehicleParts, []);
  });
}
