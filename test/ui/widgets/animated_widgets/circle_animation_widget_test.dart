import 'package:aleteo_car/ui/widgets/animated_widgets/circle_animation_widget.dart';
import 'package:aleteo_car/ui/widgets/buttons/animated_icon_button_widget.dart';
import 'package:aleteo_car/ui/widgets/custom_shapes_widgets/custom_circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';

void main() {
  testWidgets('Test CircleAnimationWidget', (tester) async {
    const Key circleAnimationWidgetKey = Key('circleAnimationKey');
    await tester.pumpWidget(const MaterialApp(
      home: CircleAnimationWidget(
        key: circleAnimationWidgetKey,
      ),
    ));

    final StatefulElement circleElement =
        tester.element(find.byKey(circleAnimationWidgetKey));

    final CircleAnimationWidgetState stateCircle =
        circleElement.state as CircleAnimationWidgetState;

    expect(stateCircle.controller.duration, const Duration(seconds: 4));
    expect(stateCircle.circleAnimation.value, -pi / 2);
    expect(stateCircle.sinAnimation.value, -1);

    expect(
        find.byWidgetPredicate((widget) =>
            widget is CustomPaint &&
            widget.painter is CustomCirclePainterWidget),
        findsOneWidget);

    expect(find.byType(AnimatedIconButtonWidget), findsOneWidget);

    stateCircle.controller.value = 4;

    await tester.pumpAndSettle();

    expect(stateCircle.circleAnimation.value, 3 * pi / 2);
    expect(stateCircle.sinAnimation.value, 1);
  });
}
