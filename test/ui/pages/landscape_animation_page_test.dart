import 'package:aleteo_car/ui/pages/landscape_animation_page.dart';
import 'package:aleteo_car/ui/widgets/landscapes/landscape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test LandscapeAnimationPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LandScapeAnimationPage(),
    ));

    expect(find.byType(LandscapeWidget), findsOneWidget);
  });
}
