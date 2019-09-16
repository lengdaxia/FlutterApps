import 'package:flutter/material.dart';
void main() => runApp(MyApp());


final themeData1 = ThemeData(
  primarySwatch: Colors.cyan,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.purple,
    textTheme: ButtonTextTheme.primary,
    shape: StadiumBorder(),
  ),
);


final themeData2 = ThemeData(
  primarySwatch: Colors.green,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.lightBlue,
  ),
);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'AnimatiedTheme example',
      theme: themeData1,
      home: MyThemedPage(),
    );
  }
}

class MyThemedPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyThemedPageState();
  }
}
class _MyThemedPageState extends State<MyThemedPage>{
  ThemeData themeData;

  @override
  void initState() {
    super.initState();
    themeData = themeData1;
  }

  void _updateTheme(){
    if(ThemeData == themeData1){
      print('Theme data1 ');
    }else{
      print('Theme data 2'); 
    }

    setState(() {
        themeData = themeData == themeData1 ? themeData2 : themeData1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: const Duration(milliseconds: 2000),
      curve: ElasticInOutCurve(),
      data: themeData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedTheme Example'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: _updateTheme,
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('I am a button'),
                onPressed: _updateTheme,
              ),
              Text('I am some Text')
            ],
          ),
        ),
      ),
    );
  }
}