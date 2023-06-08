import 'package:aleteo_car/ui/widgets/vehicle_parts/car_wheels/car_wheel_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarWheelWorkshopCustomPainter builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarWheelWorkshopCustomPainter(),
    ));

    expect(find.byType(CarWheelWorkshopCustomPainter), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarWheelWorkshopCustomPainter applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarWheelWorkshopCustomPainter(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarWheelWorkshopCustomPainter),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarWheelWorkshopPainter painter =
        customPaintWidget.painter as CarWheelWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('shouldRepaint returns false', () {
    const painter = CarWheelWorkshopPainter(color: Colors.red);
    const oldDelegate = CarWheelWorkshopPainter(color: Colors.blue);

    final shouldRepaint = painter.shouldRepaint(oldDelegate);

    expect(shouldRepaint, isFalse);
  });
}
