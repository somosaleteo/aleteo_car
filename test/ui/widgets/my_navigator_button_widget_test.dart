import 'package:aleteo_car/ui/pages/box_model_page.dart';
import 'package:aleteo_car/ui/widgets/my_navigator_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MyNavigatorButtonWidget', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyNavigatorButtonWidget(
          size: Size(50, 50),
          label: 'Test NavigatorButton',
          page: BoxModelPage(),
          child: Icon(Icons.thumb_up)),
    ));

    expect(find.byIcon(Icons.thumb_up), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
    expect(find.text('Test NavigatorButton'), findsOneWidget);

    await tester.tap(find.byType(MaterialButton));

    await tester.pumpAndSettle();

    expect(find.byType(BoxModelPage), findsOneWidget);
  });
}
