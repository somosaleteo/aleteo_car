import 'package:aleteo_car/ui/widgets/landscapes/street_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StreetWidget has correct color', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StreetWidget(),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final Container containerWidget = tester.firstWidget(containerFinder);
    expect(containerWidget.color, Colors.black87);
  });
}
