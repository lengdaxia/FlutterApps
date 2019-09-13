import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Align Demo',
      home: Scaffold(
        body: AlignExamples(),
      ),
    );
  }
}

class AlignExamples extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      Flexible(
        flex: 1,
        child: Container(
          color: Colors.black26,
          child: Align(
            alignment: Alignment(0.0, 0.0),
            child: Text('Centered'),
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                color: Colors.black12,
              ),
            ),

            Align(
              alignment: Alignment(-1, -1),
              child: Text('Top Left'),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text('Top Center'),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Center Left'),
            ),
            Align(
              alignment: Alignment(-1,0.95),
              child: Text('bottom left'),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Text('Centered'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('Center Right'),
            ),
            Align(
              alignment: Alignment(1, 0.95),
              child: Text('bottom right'),
            ),

            Align(
              alignment: Alignment(1, -1),
              child: Text('Top Right'),
            ),

            Align(
              alignment: Alignment(0, 0.95),
              child: Text('Bootom Center'),
            ),
          ],
        ),
      )
      ],
    );
  }
}