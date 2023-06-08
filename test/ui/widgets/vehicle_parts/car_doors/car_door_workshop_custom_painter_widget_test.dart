import 'package:aleteo_car/ui/widgets/vehicle_parts/car_doors/car_door_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarDoorsWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarDoorsWorkshopCustomPainterWidget(),
    ));
    expect(find.byType(CarDoorsWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarDoorsWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarDoorsWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarDoorsWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarDoorsWorkshopPainter painter =
        customPaintWidget.painter as CarDoorsWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarDoorsWorkshopPainter should not repaint', () {
    const painter = CarDoorsWorkshopPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
