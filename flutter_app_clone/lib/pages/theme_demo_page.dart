import 'package:flutter/material.dart';

/*
* ThemeData({
  Brightness brightness, //深色还是浅色
  MaterialColor primarySwatch, //主题颜色样本，见下面介绍
  Color primaryColor, //主色，决定导航栏颜色
  Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。
  Color cardColor, //卡片颜色
  Color dividerColor, //分割线颜色
  ButtonThemeData buttonTheme, //按钮主题
  Color cursorColor, //输入框光标颜色
  Color dialogBackgroundColor,//对话框背景颜色
  String fontFamily, //文字字体
  TextTheme textTheme,// 字体主题，包括标题、body等文字样式
  IconThemeData iconTheme, // Icon的默认样式
  TargetPlatform platform, //指定平台，应用特定平台控件风格
  ...
})
* */

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  Color _themeColor = Colors.teal;
  
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(data: ThemeData(primarySwatch: _themeColor,iconTheme: IconThemeData(color: _themeColor)), child: Scaffold(
      appBar: AppBar(title: Text('主题测试'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text('  颜色跟随主题'),
            ],
          ),
          Theme(data: themeData.copyWith(iconTheme: themeData.iconTheme.copyWith(color: Colors.black)), child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色固定黑色")
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState((){
          _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
        }),
        child: Icon(Icons.palette),
      ),
    ));
  } 
}
