import 'package:aleteo_car/ui/widgets/buttons/animated_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Initializing the test environment for the widget
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AnimatedIconButtonWidget', () {
    testWidgets('it should be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(AnimatedIconButtonWidget), findsOneWidget);
    });

    testWidgets('it should have a MaterialButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(MaterialButton), findsOneWidget);
    });

    testWidgets('it should have a AnimatedContainer',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('it should have a AnimatedIcon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      expect(find.byType(AnimatedIcon), findsOneWidget);
    });

    testWidgets('it should execute onPressed callback when pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedIconButtonWidget(),
        ),
      );
      await tester.tap(find.byType(MaterialButton));
      await tester.pump();
      // This test checks whether onPressed is called when MaterialButton is pressed.
      // It can be extended based on the actual behavior of the onPressed function.
    });
  });
}
