import 'package:aleteo_car/ui/pages/basic_geometric_shapes_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test CirclePainter', (tester) async {
    final CustomPainter newCircle = CirclePainter();
    final CustomPainter oldCircle = CirclePainter();

    expect(newCircle.shouldRepaint(oldCircle), false);
  });
  testWidgets('Test RectanglePainter', (tester) async {
    final CustomPainter newRectangle = RectanglePainter();
    final CustomPainter oldRectangle = RectanglePainter();

    expect(newRectangle.shouldRepaint(oldRectangle), false);
  });
  testWidgets('Test TrianglePainter', (tester) async {
    final CustomPainter newTriangle = TrianglePainter();
    final CustomPainter oldTriangle = TrianglePainter();

    expect(newTriangle.shouldRepaint(oldTriangle), false);
  });
  testWidgets('Test LinePainter', (tester) async {
    final CustomPainter newLine = LinePainter();
    final CustomPainter oldLine = LinePainter();

    expect(newLine.shouldRepaint(oldLine), false);
  });

  testWidgets('Test BasicGeometricShapesPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: BasicGeometricShapesPage(),
    ));

    expect(find.text('Figuras básicas'), findsOneWidget);

    expect(find.byType(GridView), findsOneWidget);

    expect(
        find.byWidgetPredicate((widget) =>
            widget is CustomPaint && widget.painter is CirclePainter),
        findsOneWidget);

    expect(
        find.byWidgetPredicate((widget) =>
            widget is CustomPaint && widget.painter is RectanglePainter),
        findsOneWidget);

    expect(
        find.byWidgetPredicate((widget) =>
            widget is CustomPaint && widget.painter is TrianglePainter),
        findsOneWidget);

    expect(
        find.byWidgetPredicate(
            (widget) => widget is CustomPaint && widget.painter is LinePainter),
        findsOneWidget);
  });
}
