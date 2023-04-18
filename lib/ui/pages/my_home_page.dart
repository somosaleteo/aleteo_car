import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/cars/car_main_container_widget.dart';
import '../widgets/cars/car_types/car_custom_fiat_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tmp = dpFromSize(MediaQuery.of(context).size, 150, true);
    final Size size2 = Size(tmp * 1.25, tmp);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarMainContainerWidget(
              size: size2,
              showLayoutColors: false,
            ),
            const SizedBox(
              width: double.infinity,
              height: 10.0,
            ),
            CarCustomFiatWidget(
              size: size2,
              showLayoutColors: true,
            ),
            const SizedBox(
              width: double.infinity,
              height: 10.0,
            ),
            CarCustomFiatWidget(
              size: size2,
              showLayoutColors: false,
            ),
          ],
        ),
      ),
    );
  }
}
