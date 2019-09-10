import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Persistent Bottom Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: MyHomePage(),),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage> {
  PersistentBottomSheetController _controller;
  bool _isSheetOn = false;

  _updateButtonState() async {
    if(_isSheetOn){
      setState(() {
        _isSheetOn = false;
      });

      _controller.close();
    }else{
        setState((){
          _isSheetOn = true;
        });
        await _controller.closed;
        setState(() {
          _isSheetOn = false;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(
          _isSheetOn ? 'Close the bottom sheet':'Open the bottom sheet'),
        onPressed: (){

          if(!_isSheetOn) _controller = _showBottomSheet(context);
          _updateButtonState();
        },
      ),
    );
  }
}

PersistentBottomSheetController _showBottomSheet(BuildContext context) {
  return showBottomSheet(
    context: context,
    builder: (context){
      return Container(
        color: Colors.teal,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('I will persist until you close me', style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),),
              IconButton(onPressed:() => Navigator.pop(context),icon: Icon(Icons.close,color: Colors.white,),)
            ],
          ),
        ),
      );
    }
  );
}