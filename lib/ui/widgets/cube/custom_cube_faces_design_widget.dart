import 'package:flutter/material.dart';

class CustomCubeFaceDesignWidget extends StatelessWidget {
  const CustomCubeFaceDesignWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.2,
      color: color,
      child: Image.asset(
        'assets/aleteo.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
