import 'package:aleteo_car/ui/widgets/vehicle_parts/car_trunks/car_trunk_workshop_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CarTrunkWorkshopCustomPainterWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: CarTrunkWorkshopCustomPainterWidget(),
    ));

    expect(find.byType(CarTrunkWorkshopCustomPainterWidget), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('CarTrunkWorkshopCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: CarTrunkWorkshopCustomPainterWidget(color: testColor),
    ));
    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
      of: find.byType(CarTrunkWorkshopCustomPainterWidget),
      matching: find.byType(CustomPaint),
    );

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarTrunkWorkshopPainter painter =
        customPaintWidget.painter as CarTrunkWorkshopPainter;

    expect(painter.color, equals(testColor));
  });

  test('shouldRepaint returns false', () {
    const painter = CarTrunkWorkshopPainter(color: Colors.red);
    const oldDelegate = CarTrunkWorkshopPainter(color: Colors.blue);

    final shouldRepaint = painter.shouldRepaint(oldDelegate);

    expect(shouldRepaint, isFalse);
  });
}
