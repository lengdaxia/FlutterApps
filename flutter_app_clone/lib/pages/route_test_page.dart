import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';


class RouterTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('打开提示页'),
              onPressed: () async {
                var result = await Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context){
                      return TipPage(text: "我是提示abc",);
                    }
                  ),
                );
                print("路由返回值: $result");
              },
            ),
          ],
        ),
      ),
    );
  }
}


class TipPage extends StatelessWidget {
  TipPage({Key key, @required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('tip page'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(text),
                RaisedButton(
                  child: Text('back'),
                  onPressed: (){

                    FlutterWebBrowser.openWebPage(url: "https://flutter.io/", androidToolbarColor: Colors.deepPurple);
                    Navigator.pop(context,"我是返回值123");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}