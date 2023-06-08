import 'package:aleteo_car/ui/widgets/vehicle_parts/car_cockpits/car_cockpit_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarCockpitWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarCockpitWorkshopCustomPainterWidget(),
    ));
    expect(find.byType(CarCockpitWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets(
      'CarCockpitWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarCockpitWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarCockpitWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarCockpickWorkshopPainter painter =
        customPaintWidget.painter as CarCockpickWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarCockpickWorkshopPainter should not repaint', () {
    const painter = CarCockpickWorkshopPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
