import 'package:aleteo_car/ui/widgets/cars/car_types/car_workshop_custom_painter_fiat_widget%20copy.dart';
import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/my_custom_scaffold_widget.dart';

class MyCarWorkshopCustomPainterPage extends StatelessWidget {
  const MyCarWorkshopCustomPainterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tmp = dpFromSize(MediaQuery.of(context).size, 380, true);
    final Size size = Size(tmp * 1.25, tmp);

    return MyCustomScaffold(
      title: 'Usando Custom painter',
      page: Center(
        child: CarWorkshopCustomPainterFiatWidget(
          size: size,
          showLayoutColors: false,
        ),
      ),
    );
  }
}
