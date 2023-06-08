import 'package:aleteo_car/ui/widgets/vehicle_parts/car_rear_lights/car_rear_light_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarRearLightCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarRearLightCustomPainterWidget(),
    ));
    expect(find.byType(CarRearLightCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarRearLightCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarRearLightCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarRearLightCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarRearLightPainter painter =
        customPaintWidget.painter as CarRearLightPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarRearLightPainter should not repaint', () {
    const painter = CarRearLightPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
