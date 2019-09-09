import 'package:flutter/material.dart';
import 'simple_example.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        theme: panelTheme,
        title: 'Pannel Demo',
        home: SimpleExample(),
      );
  }
}


