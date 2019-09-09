import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'custom_navibar',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: BottomNavExamplePage(),
    );
  }
}

class BottomNavExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavExamplePageState();
  }
}

class _BottomNavExamplePageState extends State<BottomNavExamplePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body('Index $index'),
      bottomNavigationBar: TwoItemBottomNavBar(
          index: index,
          callBack: (newIndex) => setState(
                () => this.index = newIndex,
              )),
    );
  }
}

class Body extends StatelessWidget {
  Body(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.display2,
        ),
      ),
    );
  }
}

class TwoItemBottomNavBar extends StatelessWidget {
  TwoItemBottomNavBar({this.index, this.callBack});
  final int index;
  final Function(int) callBack;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: callBack,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Mine')),
      ],
    );
  }
}

class FiveItemBottomNavBar extends StatelessWidget {
  FiveItemBottomNavBar(this.index, this.callBack);
  final int index;
  final Function(int) callBack;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: callBack,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      ],
    );
  }
}
