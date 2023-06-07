import 'package:aleteo_car/ui/pages/seno_animation_page.dart';
import 'package:aleteo_car/ui/widgets/animated_widgets/circle_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test SinAnimationPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SinAnimationPage(),
    ));

    expect(find.text('Animación de ejemplo del Seno'), findsOneWidget);
    expect(find.byType(CircleAnimationWidget), findsOneWidget);
  });
}
