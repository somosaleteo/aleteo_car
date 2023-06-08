import 'package:aleteo_car/ui/widgets/vehicle_parts/car_doors/car_door_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarDoorsCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarDoorsCustomPainterWidget(),
    ));
    expect(find.byType(CarDoorsCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarDoorsCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarDoorsCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarDoorsCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarDoorsPainter painter =
        customPaintWidget.painter as CarDoorsPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarDoorsPainter should not repaint', () {
    const painter = CarDoorsPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
