import 'package:aleteo_car/ui/widgets/vehicle_parts/car_bonnets/car_bonnet_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarBonnetWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarBonnetWorkshopCustomPainterWidget(),
    ));
    expect(find.byType(CarBonnetWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets(
      'CarBonnetWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarBonnetWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarBonnetWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarBonnetWorkshopPainter painter =
        customPaintWidget.painter as CarBonnetWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarBonnetWorkshopPainter should not repaint', () {
    const painter = CarBonnetWorkshopPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
