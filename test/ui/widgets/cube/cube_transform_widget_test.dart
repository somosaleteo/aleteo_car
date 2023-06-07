import 'package:aleteo_car/ui/widgets/cube/cube_stack_faces_widget.dart';
import 'package:aleteo_car/ui/widgets/cube/cube_transform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Testing CubeTransformWidget', (tester) async {
    const Key cubeTransformKey = Key('cubeTransformWidgetKey');
    await tester.pumpWidget(
      const MaterialApp(
        home: CubeTransformWidget(
          key: cubeTransformKey,
        ),
      ),
    );

    expect(find.byType(CubeStackFacesWidget), findsOneWidget);

    final StatefulElement cubeTransformStatefulElement =
        tester.element(find.byKey(cubeTransformKey));
    final CubeTransformWidgetState cubeState =
        cubeTransformStatefulElement.state as CubeTransformWidgetState;

    expect(cubeState.cubeAnimationController.duration,
        const Duration(seconds: 60));
    expect(cubeState.transformationMatrix, Matrix4.identity());
    expect(cubeState.animation.value, 0.00);

    cubeState.cubeAnimationController.value = 0.5;

    await tester.pumpAndSettle();

    expect(cubeState.transformationMatrix.entry(3, 2), closeTo(0.001, 0.00099));
    cubeState.cubeAnimationController.value = 60;
    await tester.pumpAndSettle();
    expect(cubeState.animation.value, 125.66);
  });
}
