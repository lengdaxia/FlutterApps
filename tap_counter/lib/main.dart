import 'package:flutter/material.dart';
import 'NewRoute.dart';
import 'DebugPage.dart';
import 'package:flutter/rendering.dart';

void main(){
  // debugPaintSizeEnabled = true;
    runApp(new MyApp());
}

// void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'tapcounter demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'new_page':(context)=> NewRoute(),
        'debug_page':(context) => DebugPage(),
      },
      home:new MyHomePage(title:'Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}):super(key:key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _MyHomePageState();
  }
}
class _MyHomePageState extends State<MyHomePage>{
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('You Have Pushed The Bbutton this many times:'),
            new Text('$_counter', style: Theme.of(context).textTheme.display1),

            FlatButton(
              child: Text('Open new route'),
              textColor: Colors.blue,
              onPressed: (){
                // 1 普通跳转
                // Navigator.push(context, 
                // new MaterialPageRoute(builder: (context){
                //     return new NewRoute();
                // }));
                // 注册了路由表跳转
                // Navigator.pushNamed(context,'new_page');
                // 传参数跳转
                Navigator.of(context).pushNamed('new_page',arguments: 'hi');
              },
            ),
          ],
          
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}