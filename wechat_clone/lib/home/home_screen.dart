import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;
  // final AnimationController: _animation;


  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon}) :
    _icon = icon,
    _title = title,
    _activeIcon = activeIcon,
    item = new BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      title: new Text(title),
      backgroundColor: Colors.white,
    );
    
}

class HomeScreen extends StatefulWidget {


  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();

    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
        ),
      NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.radio),
        activeIcon: Icon(Icons.access_alarm),
        ),
      NavigationIconView(
        title: '发现',
        icon: Icon(Icons.tab),
        activeIcon: Icon(Icons.access_alarm),
        ),
      NavigationIconView(
        title: '我',
        icon: Icon(Icons.undo),
        activeIcon: Icon(Icons.access_alarm),
        ),
    ];
  }

  @override
  Widget build(context){
    final BottomNavigationBar botttomNaviBar = new BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view)  {
        return view.item;
      }).toList(),
      currentIndex: 0,
      type:BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击的是第 $index 个tab');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: botttomNaviBar,
    );
  }
}