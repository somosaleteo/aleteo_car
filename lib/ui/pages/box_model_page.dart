import 'package:aleteo_car/ui/widgets/my_custom_scaffold_widget.dart';
import 'package:flutter/material.dart';

class BoxModelPage extends StatelessWidget {
  const BoxModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screnSizeWidth = MediaQuery.of(context).size.width;
    final screenSizeHeight = MediaQuery.of(context).size.height;

    final marginWidth = screnSizeWidth * 0.1;
    final marginHeight = screenSizeHeight * 0.04;

    final paddingWidth = screnSizeWidth * 0.02;
    final paddingHeight = screenSizeHeight * 0.03;

    const borderWidth = 1.0;
    const marginColor = Color(0xFFF8CEA2);
    const borderColor = Colors.black;

    final width = MediaQuery.of(context).size.width;

    return MyCustomScaffold(
        page: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Elemento',
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium!.fontSize),
              ),
              Container(
                color: Colors.grey.shade200,
                width: width * 0.4,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: marginWidth,
                    vertical: marginHeight,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: borderWidth,
                      color: borderColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingWidth,
                    vertical: paddingHeight,
                  ),
                  child: const Text('Contenido de Box model'),
                ),
              ),
              Text(
                'Visualización Box model',
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall!.fontSize),
              ),
              Container(
                color: marginColor,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: marginWidth,
                    vertical: marginHeight,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingWidth,
                    vertical: paddingHeight,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: borderWidth,
                        color: borderColor,
                      ),
                      color: const Color(0xFFC4D08E)),
                  child: Container(
                    color: const Color(0xFF8EB6C2),
                    child: const Text('Contenido de Box model'),
                  ),
                ),
              ),
            ],
          ),
        ),
        title: "Box model");
  }
}
