import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new LayoutExampleApp());
}

class LayoutExampleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColorBrightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends  StatefulWidget{

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> pages = <String, Widget> {
      'My music ' : new Center(
        child: new Text('My Music not implemented'),
      ),
      'Shared': new Center(
        child: new Text('Shared not implemented'),
      ),
      'Feed': new Feed(),
    };

    TextTheme textTheme = Theme.of(context).textTheme;

    return new Stack(
      children: <Widget>[
      new Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              const Color.fromARGB(255, 253, 72, 72),
              const Color.fromARGB(255, 87, 97, 249),
            ],
            stops: [0.0,1.0],
          )
        ),
        child: new Align(
          alignment: FractionalOffset.bottomCenter,
          child: new Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Demo',
              style: textTheme.headline.copyWith(
                color: Colors.grey.shade800.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      new Scaffold(
        backgroundColor: const Color(0x00000000),
        appBar: AppBar(
          backgroundColor: const Color(0x00000000),
          elevation: 0.0,
          leading: new Center(
            child: new ClipOval(
              child: new Image.network('http://i.imgur.com/TtNPTe0.jpg'),
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                print('点击了添加');
              },
            ),
          ],
          title: const Text('marlon\'s songs'),
          bottom: new CustomTabBar(_pageController, pages.keys.toList()),
        ),
        body: new PageView(
          controller: _pageController,
          children: pages.values.toList(),
        ),
      ),
      ],
    );
  }
}

class CustomTabBar extends AnimatedWidget implements PreferredSizeWidget {
  CustomTabBar(this.pageController, this.pageNames) : super(listenable: pageController);

  final PageController pageController;
  final List<String> pageNames;

  @override
  final Size preferredSize = new Size(0.0, 40.0);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return new Container(
      height: 40.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: new BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.5),
        borderRadius: new BorderRadius.circular(20.2),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: new List.generate(pageNames.length, (int index) {
          return new InkWell(
            child: new Text(
                    pageNames[index],
                    style: textTheme.subhead.copyWith(
                    color: Colors.white.withOpacity(
                      index == pageController.page ? 1.0 : 0.2,
                    ),
                  ),
                ),
            onTap: () {
              pageController.animateToPage(
                index,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            },
          );
        }),
      ),
    );
  }
}


class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Song(title: 'Trapadelic lobo', author: 'lillbobeats',likes: 4,),
        Song(title: 'Different', author: 'younglowkey',likes: 23),
        new Song(title: 'Future', author: 'younglowkey', likes: 2),
        new Song(title: 'ASAP', author: 'tha_producer808', likes: 13),
        new Song(title: '🌲🌲🌲', author: 'TraphousePeyton'),
        new Song(title: 'Something sweet...', author: '6ryan'),
        Song(title: 'Sharpie', author: 'Fergie_6'),
      ],
    );
  }
}

class Song extends StatelessWidget {
  const Song({this.title, this.author,this.likes});

  final String title;
  final String author;
  final int likes;

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: new BoxDecoration(
        color: Colors.grey.shade200.withOpacity(0.3),
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: IntrinsicHeight(
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(top: 4.0,bottom: 4.0, right: 10.0),
              child: new CircleAvatar(
                backgroundImage:  new NetworkImage('http://thecatapi.com/api/images/get?format=src'
                      '&size=small&type=jpg#${title.hashCode}'),
                radius: 20.0,
              ),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(title, style: textTheme.subhead),
                  Text(author, style: textTheme.caption),
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new InkWell(
                child: new Icon(Icons.play_arrow, size: 40.0),
                onTap: () {
                  print('');
                },
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 5.0),
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite, size: 25.0),
                    Text('${likes ?? ''}'),
                  ],
                ),
                onTap: () {
                  print('tap likes');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


