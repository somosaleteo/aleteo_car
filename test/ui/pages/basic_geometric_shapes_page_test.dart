import 'package:aleteo_car/ui/pages/basic_geometric_shapes_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test CirclePainter', (tester) async {
    // await tester.pumpWidget(MaterialApp(
    //   home: CustomPaint(
    //     painter: CirclePainter(),
    //   ),
    // ));

    // final rendered = tester.renderObject(find.byWidgetPredicate(
    //     (widget) => widget is CustomPaint && widget.painter is CirclePainter));

    // final canvas = RenderCustomPaint();

    // final recorder = PictureRecorder();
    // final canvasForTesting = Canvas(recorder);

    // canvas.painter?.paint(canvasForTesting, const Size(100, 100));

    // final picture = recorder.endRecording();
    // final image = await picture.toImage(100, 100);

    // final byteData = await image.toByteData(format: ImageByteFormat.png);
    // final pngBytes = byteData!.buffer.asUint8List();

    // final pixelColor = pngBytes[0];
    // expect(pixelColor, 0);
  });
  testWidgets('Test RectanglePainter', (tester) async {});
  testWidgets('Test TrianglePainter', (tester) async {});
  testWidgets('Test LinePainter', (tester) async {});

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
