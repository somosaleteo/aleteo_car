import 'package:aleteo_car/ui/widgets/vehicle_parts/car_front_lights/car_front_light_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarFrontLightWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarFrontLightWorkshopCustomPainterWidget(),
    ));
    expect(
        find.byType(CarFrontLightWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets(
      'CarFrontLightWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarFrontLightWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarFrontLightWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarFrontLightWorkshopPainter painter =
        customPaintWidget.painter as CarFrontLightWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarFrontLightWorkshopPainter should not repaint', () {
    const painter = CarFrontLightWorkshopPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
