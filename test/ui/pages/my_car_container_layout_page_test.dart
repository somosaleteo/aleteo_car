import 'package:aleteo_car/ui/pages/my_car_container_layout_page.dart';
import 'package:aleteo_car/ui/widgets/cars/car_main_container_widget.dart';
import 'package:aleteo_car/ui/widgets/my_custom_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MyCarLayoutPage', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyCarLayoutPage(),
    ));

    expect(find.byType(MyCustomScaffold), findsOneWidget);
    expect(find.byType(CarMainContainerWidget), findsOneWidget);
  });
}
