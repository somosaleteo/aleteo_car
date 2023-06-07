import 'package:aleteo_car/ui/widgets/landscapes/tree_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TreeWidget is created', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TreeWidget(),
      ),
    );

    final treeFinder = find.byType(TreeWidget);
    expect(treeFinder, findsOneWidget);
  });

  testWidgets('TreeWidget contains CustomPaint and ClipRRect',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TreeWidget(),
      ),
    );

    final customPaintFinder = find.byType(CustomPaint);
    expect(customPaintFinder, findsWidgets);

    final clipRRectFinder = find.byType(ClipRRect);
    expect(clipRRectFinder, findsOneWidget);
  });

  testWidgets('TreeWidget has the correct size', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: TreeWidget(),
        ),
      ),
    );

    final treeElement = tester.element(find.byType(TreeWidget));

    expect(treeElement.size?.height, 300);
    expect(treeElement.size?.width, 200);
  });

  testWidgets('shouldRepaint returns false', (WidgetTester tester) async {
    const myPainter = TreePainter();
    const oldMyPainter = TreePainter();
    expect(myPainter.shouldRepaint(oldMyPainter), false);
  });
}
