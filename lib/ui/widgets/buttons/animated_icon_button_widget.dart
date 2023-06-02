import 'package:aleteo_car/ui/widgets/animated_controllers/general_animation_controller.dart';
import 'package:flutter/material.dart';

class AnimatedIconButtonWidget extends StatefulWidget {
  const AnimatedIconButtonWidget({
    super.key,
  });

  @override
  State<AnimatedIconButtonWidget> createState() =>
      _AnimatedIconButtonWidgetState();
}

class _AnimatedIconButtonWidgetState extends State<AnimatedIconButtonWidget>
    with TickerProviderStateMixin {
  double radiusValue = 25;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  void onPressed() {
    setState(() {
      if (generalAnimationController.isPlaying) {
        radiusValue = 5.0;
        controller.forward();
      } else {
        controller.reverse();
        radiusValue = 25.0;
      }
      generalAnimationController.togglePlayPause();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(seconds: 1),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(radiusValue),
        ),
        child: AnimatedIcon(
          progress: controller,
          icon: AnimatedIcons.pause_play,
        ),
      ),
    );
  }
}
