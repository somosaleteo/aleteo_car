import 'package:flutter/material.dart';

import '../../helpers/responsive_helper.dart';
import '../widgets/cars/car_main_container_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Size(
      dp(context, 400),
      dp(context, 300),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarMainContainerWidget(
              size: size,
              showLayoutColors: false,
            ),
          ],
        ),
      ),
    );
  }
}
