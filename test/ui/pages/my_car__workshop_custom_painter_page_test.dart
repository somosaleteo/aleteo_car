import 'package:aleteo_car/ui/pages/my_car__workshop_custom_painter_page.dart';
import 'package:aleteo_car/ui/widgets/cars/car_types/car_workshop_custom_painter_fiat_widget_copy.dart';
import 'package:aleteo_car/ui/widgets/my_custom_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Car Wokshop CustomPainter', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyCarWorkshopCustomPainterPage(),
    ));

    expect(find.byType(MyCustomScaffold), findsOneWidget);

    expect(find.byType(CarWorkshopCustomPainterFiatWidget), findsOneWidget);
  });
}
