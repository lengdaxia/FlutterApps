import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page_view demo',
      home:Scaffold(
        body: PaperWrapper(),
        // SafeArea(
        //   child: 
        // ),
      ),
    );
  }
}

class PaperWrapper extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 1);
      return PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Page1(controller),
          Page2(),
          Page3(),
        ],
        onPageChanged: (i) => print('Page changed to $i'),
      );
  }
}

class Page1 extends StatelessWidget{
  Page1(this.controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.green,
      child: Center(
        child: GestureDetector(
          onTap: () => controller.animateToPage(2,duration: Duration(milliseconds: 500), curve:Curves.easeInOut),
          child: Text('I am page1'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('I am Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('I am page 3'),
      ),
    );
  }
}