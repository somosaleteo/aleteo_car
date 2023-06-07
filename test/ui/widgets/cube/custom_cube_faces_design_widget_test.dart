import 'package:aleteo_car/ui/widgets/cube/custom_cube_faces_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test CustomCubeFaceDesignWidget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomCubeFaceDesignWidget(color: Colors.red),
      ),
    );

    expect(
        find.byWidgetPredicate(
            (widget) => widget is Container && widget.color == Colors.red),
        findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
