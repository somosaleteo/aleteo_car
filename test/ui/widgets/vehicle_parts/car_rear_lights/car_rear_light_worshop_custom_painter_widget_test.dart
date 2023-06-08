import 'package:aleteo_car/ui/widgets/vehicle_parts/car_rear_lights/car_rear_light_worshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarRearLightWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarRearLightWorkshopCustomPainterWidget(),
    ));
    expect(
        find.byType(CarRearLightWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets(
      'CarRearLightWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarRearLightWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarRearLightWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarRearLightWorkshopPainter painter =
        customPaintWidget.painter as CarRearLightWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('shouldRepaint returns false', () {
    const painter = CarRearLightWorkshopPainter(color: Colors.red);
    const oldDelegate = CarRearLightWorkshopPainter(color: Colors.blue);

    final shouldRepaint = painter.shouldRepaint(oldDelegate);

    expect(shouldRepaint, isFalse);
  });
}
