import 'package:aleteo_car/ui/widgets/landscapes/clouds_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CloudsWidget is correctly created', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CloudsWidget(),
      ),
    );

    expect(find.byType(CloudsWidget), findsOneWidget);
  });

  testWidgets('CloudsWidget has correct color', (WidgetTester tester) async {
    const testColor = Colors.blue;

    await tester.pumpWidget(
      const MaterialApp(
        home: CloudsWidget(color: testColor),
      ),
    );

    final cloudsWidget = tester.widget<CloudsWidget>(find.byType(CloudsWidget));
    expect(cloudsWidget.color, testColor);
  });

  testWidgets('CloudsWidget contains CustomPaint', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CloudsWidget(),
      ),
    );

    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    const myPainter = CloudsPainter(color: Colors.black);
    const oldMyPainter = CloudsPainter(color: Colors.white);
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}
