import 'package:aleteo_car/ui/widgets/vehicle_parts/car_front_bumpers/car_front_bumper_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarFrontBumperCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarFrontBumperCustomPainterWidget(),
    ));
    expect(find.byType(CarFrontBumperCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarFrontBumperCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarFrontBumperCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarFrontBumperCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarFrontBumperPainter painter =
        customPaintWidget.painter as CarFrontBumperPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarFrontBumperPainter should not repaint', () {
    const painter = CarFrontBumperPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
