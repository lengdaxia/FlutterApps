import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
@override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Home'),),
        body: Center(
          child: Text('Hollo Home'),
        ),
      ),
    );
  }
}