import 'package:aleteo_car/ui/widgets/cars/car_main_container_widget.dart';
import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Size(dp(context, 400), dp(context, 300)),
        mainSize = Size(Responsive.of(context, .4).wp(100),
            Responsive.of(context, .3).diagonalSize);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarMainContainerWidget(size: size),
            const SizedBox(
              height: 10.0,
            ),
            CarMainContainerWidget(size: mainSize),
          ],
        ),
      ),
    );
  }
}
