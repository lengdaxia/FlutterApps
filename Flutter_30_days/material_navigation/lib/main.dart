import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(NavigationExampleApp());
}

class NavigationExampleApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return MaterialApp(
    title: 'Navigation Example',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: FirstScreen(),
  );
  }
}


class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Go to second'),
          onPressed: ()=> {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SecondScreen())
            ),
          },
        ),
      ),
    );
  }

}

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
        ),
        body: Center(
          child: RaisedButton(
            child: const Text('go to first'),
            onPressed: ()=> Navigator.of(context).pop(),
          ),
        ),
      );
  }
}