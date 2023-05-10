import 'package:aleteo_car/ui/widgets/landscapes/landscape_widget.dart';
import 'package:aleteo_car/ui/widgets/my_custom_scaffold_widget.dart';
import 'package:flutter/material.dart';

class LandScapeAnimationPage extends StatelessWidget {
  const LandScapeAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomScaffold(
      appBarColor: Colors.transparent,
      appBarShadow: 0,
      title: '¿Y si viajamos?',
      color: Colors.blue[300],
      page: const LandscapeWidget(),
    );
  }
}
