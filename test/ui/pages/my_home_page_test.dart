import 'package:aleteo_car/ui/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('''Probar la funcion para obtener el valor responsive acorde a la
  relacion de aspecto entre ancho (800.0) y alto (600.0) de la pantalla ''',
      (WidgetTester tester) async {
    // arrange
    await tester
        .pumpWidget(const MaterialApp(home: Material(child: MyHomePage())));
    final container = tester.element(find.byType(Container));
    final BuildContext context = container;

    final Size containerSize =
        Size(container.size?.width ?? 0.0, container.size?.height ?? 0.0);

    // act
    final Size size = context.size ?? Size.zero;

    // assert
    if (size.width == 800.0 && size.height == 600.0) {
      expect(size.width, 800.0);
      expect(size.height, 600.0);
      expect(containerSize.width, 533.33333333333333333333333);
      expect(containerSize.height, 400);
    }
    // apply your tests to dialog or its contents here.
  });
}
