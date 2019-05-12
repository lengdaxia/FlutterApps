import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    final pairs = new WordPair.random();
    // debugger();
    return new Scaffold(

      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text('This is new route page With $args'),
            Divider(indent: 16,height: 10,color: Colors.blue),
            Text('This is wordpair package word:$pairs'),
            Divider(),
            Image.asset('./images/test.png'),
          ],
        //
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('debug_page');
        },
        child: Text('debug'),
      ),
    );
  }
}