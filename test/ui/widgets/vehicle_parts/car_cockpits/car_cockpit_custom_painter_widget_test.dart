import 'package:aleteo_car/ui/widgets/vehicle_parts/car_cockpits/car_cockpit_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarCockpitCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarCockpitCustomPainterWidget(),
    ));
    expect(find.byType(CarCockpitCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarCockpitCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarCockpitCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarCockpitCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarCockpickPainter painter =
        customPaintWidget.painter as CarCockpickPainter;

    expect(painter.color, equals(testColor));
  });

  testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    const myPainter = CarCockpickPainter(color: Colors.white);
    const oldMyPainter = CarCockpickPainter(color: Colors.black);
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}
