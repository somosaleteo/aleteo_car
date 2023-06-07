import 'package:aleteo_car/ui/widgets/animated_controllers/general_animation_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GeneralAnimationController generalAnimationControllerTest;
  setUp(() {
    generalAnimationControllerTest = GeneralAnimationController(true);
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
}
