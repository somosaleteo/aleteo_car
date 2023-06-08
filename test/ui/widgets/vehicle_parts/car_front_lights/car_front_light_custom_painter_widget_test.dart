import 'package:aleteo_car/ui/widgets/vehicle_parts/car_front_lights/car_front_light_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarFrontLightCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarFrontLightCustomPainterWidget(),
    ));
    expect(find.byType(CarFrontLightCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarFrontLightCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarFrontLightCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarFrontLightCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarFrontLightPainter painter =
        customPaintWidget.painter as CarFrontLightPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarFrontLightPainter should not repaint', () {
    const painter = CarFrontLightPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
