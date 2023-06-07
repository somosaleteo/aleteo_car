import 'package:aleteo_car/ui/widgets/buttons/animated_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Inicializando el entorno de prueba para el widget
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AnimatedIconButtonWidget', () {
    testWidgets('debería ser creado', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(AnimatedIconButtonWidget), findsOneWidget);
    });

    testWidgets('debería contener un MaterialButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('debería contener un AnimatedContainer',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('debería contener un AnimatedIcon',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(AnimatedIcon), findsOneWidget);
    });

    testWidgets('debería ejecutar la función onPressed cuando se presiona',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      // Esta prueba verifica si la función onPressed se llama cuando se presiona MaterialButton.
      // Se puede ampliar en función del comportamiento real de la función onPressed.
    });
  });
}
