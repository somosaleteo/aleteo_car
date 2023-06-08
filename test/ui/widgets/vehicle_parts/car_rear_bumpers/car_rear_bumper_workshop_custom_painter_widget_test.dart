import 'package:aleteo_car/ui/widgets/vehicle_parts/car_rear_bumpers/car_rear_bumper_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarRearBumperWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarRearBumperWorkshopCustomPainterWidget(),
    ));
    expect(
        find.byType(CarRearBumperWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets(
      'CarRearBumperWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarRearBumperWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarRearBumperWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarRearBumperWorkshopPainter painter =
        customPaintWidget.painter as CarRearBumperWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('shouldRepaint returns false', () {
    const painter = CarRearBumperWorkshopPainter(color: Colors.red);
    const oldDelegate = CarRearBumperWorkshopPainter(color: Colors.blue);

    final shouldRepaint = painter.shouldRepaint(oldDelegate);

    expect(shouldRepaint, isFalse);
  });
}
