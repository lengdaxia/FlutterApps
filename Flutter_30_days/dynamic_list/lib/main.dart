import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dynamic list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListExamplePage(),
    );
  }
}

class ListExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Example'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int position) => 
        _getRowWithDivider(position),
        // _getRowWithBoxDecoration(position),
      ));
  }
}
Widget _getRowWithDivider(int i) {
  var children = <Widget>[
    Padding(padding: EdgeInsets.all(10.0),child: Text('Text $i'),),
    Divider(height: 5.0,color: Colors.teal,)
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children,
  );
}

Widget _getRowWithBoxDecoration(int i) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.red)),
      // borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Row $i'),
    ),
  );
}
