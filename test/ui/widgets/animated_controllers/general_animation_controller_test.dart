import 'package:aleteo_car/ui/widgets/animated_controllers/general_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GeneralAnimationController generalAnimationControllerTest;
  setUp(() {
    generalAnimationControllerTest = GeneralAnimationController(true);
  });

  tearDown(() {
    generalAnimationControllerTest.dispose();
  });

  test('Debe agregar el mapa al stream con el valor y la key establecidos', () {
    generalAnimationControllerTest.setNewController(
        controllerKeyName: 'controllerTest', value: 5.0);

    final result =
        generalAnimationControllerTest.getControllerValue('controllerTest');

    expect(result, 5.0);
  });

  test(
      'Debe cambiar el booleano con el que se construyó el GeneralAnimationController',
      () {
    generalAnimationControllerTest.togglePlayPause();
    expect(generalAnimationControllerTest.isPlaying, false);
  });

  testWidgets('Testing the Stream<bool> isPlayingStream values',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StreamBuilder<bool>(
        stream: generalAnimationControllerTest.isPlayingStream,
        initialData: true,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(snapshot.data.toString()),
                ElevatedButton(
                    onPressed: () {
                      generalAnimationControllerTest.togglePlayPause();
                    },
                    child: const Text('Toggle state'))
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ));
    expect(find.text('true'), findsOneWidget);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text('false'), findsOneWidget);
  });

  testWidgets(
      'Testing the Stream<Map<String, double>> controllerPositionValuesReportedStream values',
      (tester) async {
    final Map<String, double> animationController = {"controllerTest": 5.0};
    await tester.pumpWidget(MaterialApp(
      home: StreamBuilder<Map<String, double>>(
        stream: generalAnimationControllerTest
            .controllerPositionValuesReportedStream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          } else {
            return Column(
              children: [
                const Text('No data'),
                ElevatedButton(
                    onPressed: () {
                      generalAnimationControllerTest.setNewController(
                          controllerKeyName: "controllerTest", value: 5.0);
                    },
                    child: const Text('Agregar mapa'))
              ],
            );
          }
        },
      ),
    ));
    expect(find.text('No data'), findsWidgets);
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text(animationController.toString()), findsWidgets);
  });
}
