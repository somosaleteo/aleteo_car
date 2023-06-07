import 'package:aleteo_car/ui/pages/animated_ball_page.dart';
import 'package:aleteo_car/ui/widgets/ball/animated_ball_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test AnimatedBallPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AnimatedBallPage(),
    ));

    expect(find.text('Pelota animada'), findsOneWidget);
    expect(find.byType(AnimatedBall), findsOneWidget);
  });
}
