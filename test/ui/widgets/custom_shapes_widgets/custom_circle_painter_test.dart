import 'dart:math';

import 'package:aleteo_car/ui/widgets/custom_shapes_widgets/custom_circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CustomPainter customCircle;
  late CustomPainter newCustomCircle;

  setUp(() {
    customCircle =
        const CustomCirclePainterWidget(circleAngle: -pi / 2, sinOffset: -1.0);
    newCustomCircle = const CustomCirclePainterWidget(
        circleAngle: 3 * pi / 2, sinOffset: 1.0);
  });
  testWidgets('Test CirclePainterWidget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CustomPaint(
        painter: customCircle,
      ),
    ));
    expect(newCustomCircle.shouldRepaint(customCircle), true);
  });

  test('Debe retornar el seno de 1', () {
    final expected = sin(1 * pi * 2);

    expect(SineCurve().transform(1), expected);
  });
}
