import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> clickStreamController;
  Stream<int> clickStream;

  void initState() {
    super.initState();
    clickStreamController = StreamController<int>.broadcast();
    var counter = 0;
    clickStream = clickStreamController.stream.map((val){
      counter += val;
      return counter;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: 
       Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text('You have pushed the button this many times'),
           StreamBuilder(stream: clickStream,
           builder: (BuildContext context, AsyncSnapshot<int> snapshot){
             return Text('${snapshot?.data ?? 0}',style: Theme.of(context).textTheme.display1);
           }),
         ]
       ),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () => clickStreamController.add(1),
         tooltip: 'Increment',
         child: Icon(Icons.add),
       ),
    );
  }
}
