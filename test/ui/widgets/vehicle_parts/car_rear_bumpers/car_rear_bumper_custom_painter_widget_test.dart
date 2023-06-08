import 'package:aleteo_car/ui/widgets/vehicle_parts/car_rear_bumpers/car_rear_bumper_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarRearBumperCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarRearBumperCustomPainterWidget(),
    ));
    expect(find.byType(CarRearBumperCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarRearBumperCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarRearBumperCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarRearBumperCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarRearBumperPainter painter =
        customPaintWidget.painter as CarRearBumperPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarRearBumperPainter should not repaint', () {
    const painter = CarRearBumperPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
