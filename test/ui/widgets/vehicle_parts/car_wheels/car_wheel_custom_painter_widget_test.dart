import 'package:aleteo_car/ui/widgets/vehicle_parts/car_wheels/car_wheel_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarWheelCustomPainter builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarWheelCustomPainter(),
    ));
    expect(find.byType(CarWheelCustomPainter), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarWheelCustomPainter applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarWheelCustomPainter(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarWheelCustomPainter),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarWheelPainter painter =
        customPaintWidget.painter as CarWheelPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarWheelPainter should not repaint', () {
    const painter = CarWheelPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
