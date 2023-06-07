import 'package:aleteo_car/ui/pages/box_model_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test BoxModelPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BoxModelPage(),
    ));
    expect(find.text('Box model'), findsOneWidget);
    expect(find.text('Elemento'), findsOneWidget);
    expect(find.text('Visualización Box model'), findsOneWidget);
    expect(find.text('Contenido de Box model'), findsNWidgets(2));

    final outerContainerElement = find.byWidgetPredicate((widget) =>
        widget is Container && widget.color == Colors.grey.shade200);

    final innerContainerElement = find.byWidgetPredicate((widget) =>
        widget is Container &&
        widget.decoration ==
            BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
            ));

    expect(outerContainerElement, findsOneWidget);
    expect(innerContainerElement, findsOneWidget);

    final boxModelOuterContainer = find.byWidgetPredicate((widget) =>
        widget is Container &&
        widget.decoration ==
            BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.black,
                ),
                color: const Color(0xFFC4D08E)));
    final boxModelInnerContainer = find.byWidgetPredicate((widget) =>
        widget is Container && widget.color == const Color(0xFFF8CEA2));

    expect(boxModelOuterContainer, findsOneWidget);
    expect(boxModelInnerContainer, findsOneWidget);
  });
}
