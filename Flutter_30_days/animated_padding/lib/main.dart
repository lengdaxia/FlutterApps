import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(body: PaddedPageWithButton(),),
    );
  }
}

class PaddedPageWithButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PaddedPageWithButtonState();
  }
}
class _PaddedPageWithButtonState extends State<PaddedPageWithButton>{

  double cardPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 300,
            height: 300,

            child: AnimatedPadding(
              padding: EdgeInsets.all(cardPadding),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Card(color: Colors.red,),
            ),
          ),
          RaisedButton(
            child: Text('Tap me!'),
            onPressed: (){
              setState(() {
                cardPadding = cardPadding == 10 ? 50 : 10;
              });
            },
          )
        ],
      ),
    );
  }
}
