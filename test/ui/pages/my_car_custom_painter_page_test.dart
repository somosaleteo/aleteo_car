import 'package:aleteo_car/ui/pages/my_car_custom_painter_page.dart';
import 'package:aleteo_car/ui/widgets/cars/car_types/car_custom_painter_fiat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MyCarCustomPainterPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyCarCustomPainterPage(),
    ));

    expect(find.text('Usando Custom painter'), findsOneWidget);
    expect(find.byType(CarCustomPainterFiatWidget), findsOneWidget);
  });
}
