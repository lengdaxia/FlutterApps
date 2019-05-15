import 'package:flutter/material.dart';

class StatelessWidgetsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('StatelessWidgetsPage'),
      ),
      body: Echo(text:'Hello World')
    );
  }
}

class Echo extends StatelessWidget{
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.grey,
  }):super(key:key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}