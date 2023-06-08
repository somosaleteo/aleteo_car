import 'package:aleteo_car/ui/widgets/vehicle_parts/car_trunks/car_trunk_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarTrunkCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarTrunkCustomPainterWidget(),
    ));
    expect(find.byType(CarTrunkCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarTrunkCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarTrunkCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarTrunkCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarTrunkPainter painter =
        customPaintWidget.painter as CarTrunkPainter;

    expect(painter.color, equals(testColor));
  });

  test('CarTrunkPainter should not repaint', () {
    const painter = CarTrunkPainter(color: Colors.red);
    expect(painter.shouldRepaint(painter), false);
  });
}
