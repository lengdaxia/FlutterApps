import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class TextPage extends StatefulWidget {
  @override

  _TextPageState createState() => _TextPageState();
}


class _TextPageState extends State<TextPage> {
  TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    _tapRecognizer = TapGestureRecognizer();
    super.initState();
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  void _tapLink(){
    print('点击了link');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Hello World',
          textAlign: TextAlign.center,),
          Divider(color: Colors.grey,),
          Text("Hello World" * 6,
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          ),
          Divider(),
          Text("Hello World", 
            style:TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2, 
              fontFamily: 'Courier', 
              background: Paint()..color=Colors.yellow, 
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy)),
            Divider(),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "Home ",
                ),
                TextSpan(text: "https://joyfull.co.jp",
                style: TextStyle(color: Colors.blue),
                recognizer: _tapRecognizer..onTap = (){
                  _tapLink();
                },
                ),
              ])
            ),
            Divider(),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('hello world'),
                  Text('I am Jack'),
                  Text('I am jack ma', style: TextStyle(inherit: false, color: Colors.blue),)
                ],
              ),
            )
        ],
      ),
    );
  }
}