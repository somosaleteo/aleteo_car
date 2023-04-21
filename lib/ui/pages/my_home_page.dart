import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/cars/car_main_container_widget.dart';
import '../widgets/cars/car_types/car_custom_painter_fiat_widget.dart';
import '../widgets/my_custom_scaffold_widget.dart';
import 'box_model_page.dart';
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
                MyNavigatorButton(
                    page: const BoxModelPage(),
                    size: size,
                    label: "Box Model",
                    child: const Icon(Icons.dataset_outlined)),
                const _SeparatorWidget(),
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

class MyNavigatorButton extends StatelessWidget {
  const MyNavigatorButton({
    super.key,
    required this.size,
    required this.label,
    required this.child,
    required this.page,
  });

  final Size size;
  final String label;
  final Widget child, page;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).dialogBackgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: size.width * 0.4, child: Text(label)),
            const SizedBox(
              width: 20.0,
            ),
            child,
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
