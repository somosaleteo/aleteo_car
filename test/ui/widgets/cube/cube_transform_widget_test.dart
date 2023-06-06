import 'package:aleteo_car/ui/widgets/cube/cube_transform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing CubeTransformWidget', (tester) async {
    tester.pumpWidget(
      const MaterialApp(
        home: CubeTransformWidget(),
      ),
    );
  });
}
