import 'package:flutter/material.dart';

class MyNavigatorButtonWidget extends StatelessWidget {
  const MyNavigatorButtonWidget({
    super.key,
    required this.size,
    required this.label,
    required this.child,
    required this.page,
  });

  final Size size;
  final String label;
  final Widget child, page;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
      child: Container(
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).dialogBackgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: size.width * 0.4, child: Text(label)),
            const SizedBox(
              width: 20.0,
            ),
            child,
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
