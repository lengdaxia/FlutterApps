import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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


    var dividedWidgetList = ListTile.divideTiles(
      context: context,
      tiles: _getListData(),
      color: Colors.black
    ).toList();

    var listView = ListView(children: dividedWidgetList);

    return Scaffold(
      appBar: AppBar(
        title: Text('List Example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('添加了');
              
              dividedWidgetList.add(
                // Text('New Row')
                Padding(
                 padding: EdgeInsets.all(10.0),
                  child: Text('Row new'),
                   )
              );
            },
          ),
        ],
      ),
      body: listView,
    );
  }

  _getListData(){
    List<Widget> widgets = [];
    for (var i = 0; i < 100; i++) {
      widgets.add(
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Row $i'),
        )
      );
    }
    return widgets;
  }
}