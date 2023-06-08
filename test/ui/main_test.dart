import 'package:aleteo_car/main.dart';
import 'package:aleteo_car/ui/pages/my_home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test MyApp', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
