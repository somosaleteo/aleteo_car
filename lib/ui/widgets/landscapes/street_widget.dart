import 'package:flutter/material.dart';

class StreetWidget extends StatelessWidget {
  const StreetWidget({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: height,
      width: width,
    );
  }
}
