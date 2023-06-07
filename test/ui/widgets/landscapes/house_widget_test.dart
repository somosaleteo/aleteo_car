import 'package:aleteo_car/ui/widgets/landscapes/house_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HouseWidget is correctly created', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HouseWidget(),
      ),
    );

    expect(find.byType(HouseWidget), findsOneWidget);
  });

  testWidgets('HouseWidget contains CustomPaint', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HouseWidget(),
      ),
    );

    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('HouseWidget has expected size', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: HouseWidget(),
        ),
      ),
    );

    final houseWidget = tester.getSize(find.byType(HouseWidget));
    expect(houseWidget.width, 150);
    expect(houseWidget.height, 205);
  });

  testWidgets('HouseWidget rebuilds when key changes',
      (WidgetTester tester) async {
    final key1 = UniqueKey();
    final key2 = UniqueKey();

    await tester.pumpWidget(
      MaterialApp(
        home: HouseWidget(key: key1),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: HouseWidget(key: key2),
      ),
    );

    expect(find.byType(HouseWidget), findsOneWidget);
  });

  testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    final myPainter = HousePainter();
    final oldMyPainter = HousePainter();
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}
