import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scrolling_detection',
      home: ScrollingDetectionPage(),
    );
  }
}

class ScrollingDetectionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ScrollingDetectionPageState();
  }
}
class _ScrollingDetectionPageState extends State<ScrollingDetectionPage>{

  String tip = 'I am a scroll detector';

  bool _scrolllingSarted(){
    setState(() {
      tip = 'Wheeeeeeee!';
    });
    return false;
  }

  bool _scrollingEnded(){
    setState(() {
      tip = 'Snore...';
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(tip),
        ),
        NotificationListener<ScrollStartNotification>(
          onNotification: (_)=> _scrolllingSarted(),
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (_)=> _scrollingEnded(),
            child: Expanded(
              child: ListView(
                children: 
                  List<ListTile>.generate(100, (i) => ListTile(title: Text('$i'),)
                  ),
              ),
            ),
          ),
        )
      ],
    )
  }
}