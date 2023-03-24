import 'package:aleteo_car/helpers/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  const double kExpectResultBase = 1.333333333333333333333333333333;
  test('Probar la funcion de responsive acorde a in Size personalizado', () {
    const Size size = Size(800.0, 600.0);
    final double expectResult = dpFromSize(size, 1);
    expect(expectResult, kExpectResultBase);
    final double expectResult2 = dpFromSize(size, 10000000, true);
    expect(expectResult2, 800.0);
  });

  testWidgets('''Probar la funcion para obtener el valor responsive acorde a la
  relacion de aspecto entre ancho (800.0) y alto (600.0) de la pantalla ''',
      (WidgetTester tester) async {
    // arrange
    await tester.pumpWidget(MaterialApp(home: Material(child: Container())));
    final BuildContext context = tester.element(find.byType(Container));

    // act
    final Size size = context.size ?? Size.zero;
    final double expectResult = dp(context, 1);
    // assert
    if (size.width == 800.0 && size.height == 600.0) {
      expect(expectResult, kExpectResultBase);
    }
    // apply your tests to dialog or its contents here.
  });

  testWidgets('Responsive widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (context) {
            return Container(
              width: Responsive.of(context, 0.75).wp(50),
              height: Responsive.of(context, 0.75).wp(30),
              color: Colors.blue,
              child: Text(
                'Hello World',
                style: TextStyle(fontSize: Responsive.of(context, 0.75).wp(5)),
              ),
            );
          }),
        ),
      ),
    ));

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final container = tester.widget<Container>(containerFinder);
    expect(container.constraints?.widthConstraints().maxWidth,
        Responsive.of(tester.element(containerFinder), 0.75).wp(50));
    expect(container.color, Colors.blue);

    final textFinder = find.text('Hello World');
    expect(textFinder, findsOneWidget);

    final text = tester.widget<Text>(textFinder);
    expect(text.style!.fontSize,
        Responsive.of(tester.element(textFinder), 0.75).wp(5));
  });
}
