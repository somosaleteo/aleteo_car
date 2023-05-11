import 'package:flutter/material.dart';

class MyCustomScaffold extends StatelessWidget {
  const MyCustomScaffold({
    Key? key,
    required this.page,
    required this.title,
  }) : super(key: key);
  final Widget page;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: page,
    );
  }
}
