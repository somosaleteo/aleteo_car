import 'package:aleteo_car/ui/widgets/vehicle_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test VehiclePartWidget with false showLayout and default color',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VehiclePartWidget(
        size: Size(100, 100),
        child: Text('Testing VehiclePartWidget'),
      ),
    ));

    final widget =
        tester.widget<VehiclePartWidget>(find.byType(VehiclePartWidget));

    expect(widget.size, const Size(100, 100));
    expect(widget.showLayout, false);
    expect(widget.color, Colors.transparent);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Opacity && widget.opacity == 1.0),
        findsOneWidget);
  });

  testWidgets('Test VehiclePartWidget with true showLayout and specific color',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VehiclePartWidget(
        size: Size(100, 100),
        showLayout: true,
        color: Colors.black,
        child: Text('Testing VehiclePartWidget'),
      ),
    ));

    final widget =
        tester.widget<VehiclePartWidget>(find.byType(VehiclePartWidget));

    expect(widget.size, const Size(100, 100));
    expect(widget.showLayout, true);
    expect(widget.color, Colors.black);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Opacity && widget.opacity == 0.1),
        findsOneWidget);
  });

  testWidgets(
      'Test VehiclePartWidget with true showLayout and no specified color',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VehiclePartWidget(
        size: Size(100, 100),
        showLayout: true,
        child: Text('Testing VehiclePartWidget'),
      ),
    ));

    final widget =
        tester.widget<VehiclePartWidget>(find.byType(VehiclePartWidget));

    expect(widget.showLayout, true);
    expect(widget.color, Colors.transparent);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Opacity && widget.opacity == 0.1),
        findsOneWidget);
  });
}
