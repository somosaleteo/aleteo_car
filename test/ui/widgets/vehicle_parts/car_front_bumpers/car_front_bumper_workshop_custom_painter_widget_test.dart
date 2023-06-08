import 'package:aleteo_car/ui/widgets/vehicle_parts/car_front_bumpers/car_front_bumper_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarFrontBumperWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarFrontBumperWorkshopCustomPainterWidget(),
    ));
    expect(
        find.byType(CarFrontBumperWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets(
      'CarFrontBumperWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarFrontBumperWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarFrontBumperWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarFrontWorkshopBumperPainter painter =
        customPaintWidget.painter as CarFrontWorkshopBumperPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarFrontWorkshopBumperPainter should not repaint', () {
    const painter = CarFrontWorkshopBumperPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
