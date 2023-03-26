import 'package:flutter/material.dart';

import 'positioned_vehicle_part_widget.dart';

class MainVehicleContainerWidget extends StatelessWidget {
  const MainVehicleContainerWidget(
      {Key? key,
      required this.size,
      required this.listOfVehicleParts,
      this.color = Colors.transparent})
      : super(key: key);
  final Size size;
  final List<PositionedVehiclePartWidget> listOfVehicleParts;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: color,
      child: Stack(
        children: listOfVehicleParts,
      ),
    );
  }
}
