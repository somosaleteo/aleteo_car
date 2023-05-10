import 'package:flutter/material.dart';

class MyCustomScaffold extends StatelessWidget {
  const MyCustomScaffold({
    Key? key,
    required this.page,
    required this.title,
    this.color,
    this.appBarColor,
    this.appBarShadow,
  }) : super(key: key);
  final Widget page;
  final String title;
  final Color? color;
  final Color? appBarColor;
  final double? appBarShadow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        elevation: appBarShadow,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(title),
      ),
      body: page,
    );
  }
}
