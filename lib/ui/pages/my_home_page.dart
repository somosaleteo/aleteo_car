import 'package:aleteo_car/ui/pages/seno_animation_page.dart';
import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/cars/car_main_container_widget.dart';
import '../widgets/cars/car_types/car_custom_painter_fiat_widget.dart';
import '../widgets/cars/car_types/car_workshop_custom_painter_fiat_widget_copy.dart';
import '../widgets/my_custom_scaffold_widget.dart';
import '../widgets/my_navigator_button_widget.dart';
import 'basic_geometric_shapes_page.dart';
import 'box_model_page.dart';
import 'my_car__workshop_custom_painter_page.dart';
import 'my_car_container_layout_page.dart';
import 'my_car_container_page.dart';
import 'my_car_custom_painter_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tmp = dpFromSize(MediaQuery.of(context).size, 40, true);
    final Size size2 = Size(tmp * 1.25, tmp),
        size = Size(MediaQuery.of(context).size.width, tmp);

    return MyCustomScaffold(
        page: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _SeparatorWidget(),
                const _SeparatorWidget(),
                const _SeparatorWidget(),
                const _SeparatorWidget(),
                const _SeparatorWidget(),
                MyNavigatorButtonWidget(
                  page: const BoxModelPage(),
                  size: size,
                  label: "Box Model",
                  child: SizedBox(
                    width: size2.width,
                    height: size2.height,
                    child: const Icon(Icons.dataset_outlined),
                  ),
                ),
                const _SeparatorWidget(),
                MyNavigatorButtonWidget(
                  page: const MyCarContainerPage(),
                  size: size,
                  label: "Sin usar custom painter",
                  child: CarMainContainerWidget(
                    size: size2,
                    showLayoutColors: false,
                  ),
                ),
                const _SeparatorWidget(),
                MyNavigatorButtonWidget(
                  page: const MyCarLayoutPage(),
                  size: size,
                  label: "Layout",
                  child: CarMainContainerWidget(
                    size: size2,
                    showLayoutColors: true,
                  ),
                ),
                const _SeparatorWidget(),
                MyNavigatorButtonWidget(
                  size: size,
                  label: "Figuras Geométricas básicas",
                  page: const BasicGeometricShapesPage(),
                  child: SizedBox(
                      width: size2.width,
                      height: size2.height,
                      child: const Icon(Icons.gesture_outlined)),
                ),
                const _SeparatorWidget(),
                MyNavigatorButtonWidget(
                  page: const MyCarCustomPainterPage(),
                  size: size,
                  label: "Usando Custom Painter",
                  child: CarCustomPainterFiatWidget(
                    size: size2,
                    showLayoutColors: false,
                  ),
                ),
                MyNavigatorButtonWidget(
                  page: const MyCarWorkshopCustomPainterPage(),
                  size: size,
                  label: "¡Pintemos!",
                  child: CarWorkshopCustomPainterFiatWidget(
                    size: size2,
                    showLayoutColors: false,
                  ),
                ),
                MyNavigatorButtonWidget(
                  page: const SinAnimationPage(),
                  size: size,
                  label: "¡Animemos un circulo!",
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        title: "Presentación Custom Painter");
  }
}

class _SeparatorWidget extends StatelessWidget {
  const _SeparatorWidget();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 10.0,
    );
  }
}
