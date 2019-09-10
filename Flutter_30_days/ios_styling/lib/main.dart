import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iOS styleing demo',
      theme: ThemeData(platform: TargetPlatform.iOS),
      home: AppleHomePage(),
    );
  }
}

class AppleHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: '.SF Pro Text',
        fontSize: 17.0,
        letterSpacing: -0.38,
        color: CupertinoColors.black,
        decoration: TextDecoration.none,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Flutter Demo Home Page'),
        ),
        child: Container(color: CupertinoColors.white,child: MyHomePage(),),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key}) :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You Have Pushed the button this many times:'),
          Text('$_counter'),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CupertinoButton(child: Text('Incremtn'),onPressed: _incrementCounter,),
          )
        ],
      ),
    );
  }
}