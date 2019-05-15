import 'package:flutter/material.dart';
import 'StatefulWidgetsPage.dart';

class WidgetLifecyclePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Widget Life Cycle'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('initState()'),
            new Text('DidChangeDependencies()'),
            new Text('build()'),
            new Text('reassemble()'),
            new Text('didUpdateWidget()'),
            new Text('deactive()'),
            new Text('dispose()'),
            new Divider(),
            new Text('State widgets'),
            new FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed('StatelessWidgetsPage');
              },
              child: Text('StatelessWidgetsPage'),
            ),
            new FlatButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                    // return CounterWidget(initValue: 8);
                    return StatefullWidgetsPage();
                }));
              },
              child: Text('StatefullWidgetsPage'),
            ),
          ],
        ),
      ),
    );
  }
}