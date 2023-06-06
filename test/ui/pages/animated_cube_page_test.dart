import 'package:aleteo_car/ui/pages/animated_cube_page.dart';
import 'package:aleteo_car/ui/widgets/cube/cube_transform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Testing Animated Cube Page',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AnimatedCubePage(),
        ),
      );
      expect(find.text('¡Probemos 3 dimensiones!'), findsOneWidget);
      expect(find.byType(CubeTransformWidget), findsOneWidget);
    },
  );
}
