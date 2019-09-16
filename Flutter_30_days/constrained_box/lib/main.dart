import 'package:flutter/material.dart';

final style = TextStyle(
  fontSize: 19,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Constrained App'),
        ),
        body: DefaultTextStyle(style: style, child: ConstrainedExamples(),),
      ),
    );
  }
}

class ConstrainedExamples extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 200,
            ),
            child: Text(
              'You Should really press the button below',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 120,
              minWidth: 200
            ),
            child: RaisedButton(
              child: Text('Tap Me!', style: style,),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}