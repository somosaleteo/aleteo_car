import 'package:aleteo_car/ui/widgets/vehicle_parts/car_front_bumpers/car_front_bumper_a_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Test para comprobar que el widget se crea correctamente.
  testWidgets('CarFrontBumperAWidget should be created',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CarFrontBumperAWidget()));

    expect(find.byType(CarFrontBumperAWidget), findsOneWidget);
  });

  // Test para verificar que el widget Container se crea correctamente.
  testWidgets('CarFrontBumperAWidget creates a Container',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CarFrontBumperAWidget()));

    expect(find.byType(Container), findsOneWidget);
  });

  // Test para comprobar que se aplica el color correcto cuando se proporciona.
  testWidgets('CarFrontBumperAWidget applies color when provided',
      (WidgetTester tester) async {
    const testColor = Colors.red;

    await tester
        .pumpWidget(MaterialApp(home: CarFrontBumperAWidget(color: testColor)));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.color, equals(testColor));
  });
}
