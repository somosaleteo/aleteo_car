import 'package:aleteo_car/ui/widgets/cube/cube_stack_faces_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test CubeStackFacesWidget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CubeStackFacesWidget(),
      ),
    );
    expect(find.byType(Transform), findsNWidgets(6));
  });
}
