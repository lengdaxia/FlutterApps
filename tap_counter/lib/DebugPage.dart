import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class DebugPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Debug Page'),
      ),
      body: new Center(
        child: new FlatButton(
          onPressed: (){
            // debugDumpApp();
            debugDumpLayerTree();
            // debugDumpRenderTree();
            debugPrint('开始debug了');
          },
          child: Text('Dump App'),
        ),
      ),
    );
  }
}