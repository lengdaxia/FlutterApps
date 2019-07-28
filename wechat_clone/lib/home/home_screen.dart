import 'package:flutter/material.dart';
import '../constants.dart' show Constants, AppColors;

class NavigationIconView {
  final BottomNavigationBarItem item;
  // final AnimationController: _animation;


  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    item = new BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
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
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe60f,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe60f,
          fontFamily: Constants.IconFontFamily,
        ),
        ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe681,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe681,
          fontFamily: Constants.IconFontFamily,
        ),
        ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe61e,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe61e,
          fontFamily: Constants.IconFontFamily,
        ),
        ),
    ];
  }

  @override
  Widget build(context){
    final BottomNavigationBar botttomNaviBar = new BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('点击了搜索按钮');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              print('点击了加号');
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: botttomNaviBar,
    );
  }
}