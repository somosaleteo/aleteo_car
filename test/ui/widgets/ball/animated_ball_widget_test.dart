import 'package:aleteo_car/ui/widgets/ball/animated_ball_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Prueba de widget para verificar si AnimatedBall se crea correctamente.
  testWidgets('AnimatedBall should create its State',
      (WidgetTester tester) async {
    const animatedBall = AnimatedBall();
    await tester.pumpWidget(
      const MaterialApp(
        home: animatedBall,
      ),
    );
    expect(find.byType(SlideTransition), findsOneWidget);
  });
  // Prueba para verificar si AnimatedBallPainter dibuja correctamente
  testWidgets('AnimatedBallPainter should paint', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
          home: CustomPaint(
        painter: AnimatedBallPainter(1.0),
      )),
    );
    expect(
        find.byWidgetPredicate((widget) =>
            widget is CustomPaint && widget.painter is AnimatedBallPainter),
        findsOneWidget);
  });

  // Prueba para verificar si el AnimatedBall se deshace correctamente
  testWidgets('AnimatedBall should dispose AnimationController when disposed',
      (WidgetTester tester) async {
    const animatedBall = AnimatedBall();
    await tester.pumpWidget(const MaterialApp(
      home: animatedBall,
    ));
    final state = tester.state<State<AnimatedBall>>(find.byType(AnimatedBall));
    expect(state, isNotNull);
    await tester.pumpWidget(Container());
    expect(state.mounted, isFalse);
  });
  testWidgets('AnimatedBall should dispose AnimationController when disposed',
      (WidgetTester tester) async {
    const animatedBall = AnimatedBall();
    await tester.pumpWidget(const MaterialApp(
      home: animatedBall,
    ));
    final state = tester.state<State<AnimatedBall>>(find.byType(AnimatedBall));
    expect(state, isNotNull);
    await tester.pumpWidget(Container());
    expect(state.mounted, isFalse);
  });
  testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    final myPainter = AnimatedBallPainter(1.0);
    final oldMyPainter = AnimatedBallPainter(2.0);
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}
