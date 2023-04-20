import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/cars/car_types/car_custom_painter_fiat_widget.dart';
import '../widgets/my_custom_scaffold_widget.dart';

class MyCarCustomPainterPage extends StatelessWidget {
  const MyCarCustomPainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final tmp = dpFromSize(MediaQuery.of(context).size, 480, true);
    final tmp = Responsive.of(context, 0.8).wp(40.0);
    final Size size = Size(tmp * 1.25, tmp);

    return MyCustomScaffold(
      title: 'Usando Custom painter',
      page: Center(
        child: CarCustomPainterFiatWidget(
          size: size,
          showLayoutColors: false,
        ),
      ),
    );
  }
}
