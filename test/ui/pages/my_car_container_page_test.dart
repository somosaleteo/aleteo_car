import 'package:aleteo_car/ui/pages/my_car_container_page.dart';
import 'package:aleteo_car/ui/widgets/cars/car_main_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MyCarContainerPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyCarContainerPage(),
    ));
    expect(find.text('Usando Containers'), findsOneWidget);
    expect(find.byType(CarMainContainerWidget), findsOneWidget);
  });
}
