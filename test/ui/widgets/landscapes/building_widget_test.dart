import 'package:aleteo_car/ui/widgets/landscapes/building_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BuildingWidget is correctly created',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BuildingWidget(width: 200.0, height: 300.0),
      ),
    );

    expect(find.byType(BuildingWidget), findsOneWidget);
  });

  testWidgets('BuildingWidget has correct width and height',
      (WidgetTester tester) async {
    const width = 200.0;
    const height = 300.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: BuildingWidget(width: width, height: height),
      ),
    );

    final buildingWidget =
        tester.widget<BuildingWidget>(find.byType(BuildingWidget));
    expect(buildingWidget.width, width);
    expect(buildingWidget.height, height);
  });

  testWidgets('BuildingWidget contains CustomPaint',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BuildingWidget(width: 200.0, height: 300.0),
      ),
    );

    expect(find.byType(CustomPaint), findsWidgets);
  });

testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    final myPainter = BuildingPainter();
    final oldMyPainter = BuildingPainter();
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}


