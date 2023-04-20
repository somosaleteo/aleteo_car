import 'package:aleteo_car/ui/widgets/cars/car_types/car_custom_painter_fiat_widget.dart';
import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/cars/car_main_container_widget.dart';
import '../widgets/my_custom_scaffold_widget.dart';
import '../widgets/my_navigator_button_widget.dart';
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
                MyNavigatorButton(
                  page: const MyCarContainerPage(),
                  size: size,
                  label: "Sin usar custom painter",
                  child: CarMainContainerWidget(
                    size: size2,
                    showLayoutColors: false,
                  ),
                ),
                const _SeparatorWidget(),
                MyNavigatorButton(
                  page: const MyCarLayoutPage(),
                  size: size,
                  label: "Layout",
                  child: CarMainContainerWidget(
                    size: size2,
                    showLayoutColors: true,
                  ),
                ),
                const _SeparatorWidget(),
                MyNavigatorButton(
                  page: const MyCarCustomPainterPage(),
                  size: size,
                  label: "Usando Custom Painter",
                  child: CarCustomPainterFiatWidget(
                    size: size2,
                    showLayoutColors: false,
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
