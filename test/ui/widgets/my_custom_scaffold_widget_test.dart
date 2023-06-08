import 'package:aleteo_car/ui/widgets/my_custom_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MyCustomScaffold', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyCustomScaffold(
        page: Text('Body'),
        title: 'Testing MyCustomScaffold',
      ),
    ));

    expect(find.text('Testing MyCustomScaffold'), findsOneWidget);
    expect(find.text('Body'), findsOneWidget);
  });
}
