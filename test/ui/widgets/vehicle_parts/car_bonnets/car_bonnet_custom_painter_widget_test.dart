import 'package:aleteo_car/ui/widgets/vehicle_parts/car_bonnets/car_bonnet_custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test para comprobar que el widget se crea correctamente.
  testWidgets('CarBonnetCustomPainterWidget should be created',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: CarBonnetCustomPainterWidget()));

    expect(find.byType(CarBonnetCustomPainterWidget), findsOneWidget);
  });

  // Test para verificar que el widget CustomPaint se crea correctamente.
  testWidgets('CarBonnetCustomPainterWidget creates a CustomPaint',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: CarBonnetCustomPainterWidget()));

    expect(find.byType(CustomPaint), findsWidgets);
  });

  // Test para verificar que se aplica el color correcto al pintar el widget.
  testWidgets('CarBonnetCustomPainterWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
        home: CarBonnetCustomPainterWidget(color: testColor)));

    await tester.pumpAndSettle();

    final customPaintFinder = find.descendant(
        of: find.byType(CarBonnetCustomPainterWidget),
        matching: find.byType(CustomPaint));

    final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
    final CarBonnetPainter painter =
        customPaintWidget.painter as CarBonnetPainter;

    expect(painter.color, equals(testColor));
  });

  testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    const myPainter = CarBonnetPainter(color: Colors.white);
    const oldMyPainter = CarBonnetPainter(color: Colors.black);
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}
