import 'package:flutter/material.dart';
import 'package:flutter_app_clone/apptheme.dart';
import 'package:flutter_app_clone/pages/dialog_demo_page.dart';
import 'package:flutter_app_clone/pages/future_and_stream_demo_page.dart';
import 'package:flutter_app_clone/pages/gesture_demo_page.dart';
import 'package:flutter_app_clone/pages/notifacation_demo_page.dart';
import 'package:flutter_app_clone/pages/pointer_demo_page.dart';
import 'package:flutter_app_clone/pages/progress_demo_page.dart';
import 'package:flutter_app_clone/pages/switch_demo_page.dart';
import 'package:flutter_app_clone/pages/theme_demo_page.dart';
import 'base_page.dart';
import 'pages/index.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Basic2Advanced',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title, style: TextStyle(color: Colors.red[400])),
        contentPadding: EdgeInsets.only(left: 30, right: 16),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("第一个Flutter应用"),
            children: _generateItem(context, [
              PageInfo("路由传值", (ctx) => RouterTextPage()),
            ]),
          ),
          ExpansionTile(
            title: Text('基础组件'),
            children: _generateItem(context, [
              PageInfo("文本， 字体样式", (context) => TextPage()),
              PageInfo("textfield", (context) => TextFieldPage()),
              PageInfo("按钮", (context) => ButtonPage()),
              PageInfo("图片伸缩", (context) => ImageAndIconPage()),
              PageInfo("单选开关和复选框", (context) => SwitchPage()),
              PageInfo("进度条", (context) => ProgressPage()),
            ]),
          ),
          ExpansionTile(
            title: Text('布局类组件'),
            children: _generateItem(context, [
              PageInfo("Column居中", (context) => CenterColumnPage()),
              PageInfo("表格布局", (context) => TablePage()),
              PageInfo("对齐及相对定位", (context) => AlignPgae()),
            ]),
          ),
          ExpansionTile(
            title: Text('容器类组件'),
            children: _generateItem(context, [
              PageInfo('填充Paddding', (context) => PaddingPage()),
              PageInfo('尺寸限制类容器', (context) => SizeConstraintsPage()),
              PageInfo('DecoratedBox', (context) => DecoratedBoxPage()),
              PageInfo('Scaffold, tabbar, 底部导航栏', (context) => ScaffoldPage(),
                  withScaffold: false),
            ]),
          ),
          ExpansionTile(
            title: Text("功能性组件"),
            children: _generateItem(context, [
              PageInfo(
                  '数据共享（inheritedWidget）', (context) => InheritedWidgetPage()),
              PageInfo('跨组件状况管理(Provider)', (context) => ProviderPage()),
              PageInfo('颜色和MaterialColor', (context) => ColorPage()),
              PageInfo('主题-Theme', (context) => ThemePage()),
              PageInfo('FutureBuilder和StreamBuilder',
                  (context) => FutureAndStreamPage()),
              PageInfo('对话框', (context) => DialogPage()),
            ]),
          ),
          ExpansionTile(
            title: Text("事件处理与通知"),
            children: _generateItem(context, [
              PageInfo('通知（Notification）', (context) => Notification2Page()),
              PageInfo('原始指针事件', (context) => PointerPage()),
              PageInfo('gesture事件', (context) => GesturePage()),
            ]),
          ),
          ExpansionTile(
            title: Text("自定义组件"),
            children: _generateItem(context, [
              PageInfo('数据共享（inheritedWidget）', (context) => null),
              PageInfo('跨组件状况管理(Provider)', (context) => null),
              PageInfo('颜色和MaterialColor', (context) => null),
              PageInfo('主题-Theme', (context) => null),
              PageInfo('FutureBuilder和StreamBuilder', (context) => null),
              PageInfo('对话框', (context) => null),
            ]),
          ),
          ExpansionTile(
            title: Text("Flutter原理"),
            children: _generateItem(context, [
              PageInfo('图片加载原理与缓存', (context) => null),
            ]),
          ),
          ExpansionTile(
            title: Text("动画"),
            children: _generateItem(context, [
              PageInfo('放大动画-原始版本', (context) => null),
              PageInfo('跨组件状况管理(Provider)', (context) => null),
              PageInfo('颜色和MaterialColor', (context) => null),
              PageInfo('主题-Theme', (context) => null),
              PageInfo('FutureBuilder和StreamBuilder', (context) => null),
              PageInfo('对话框', (context) => null),
              PageInfo('FutureBuilder和StreamBuilder', (context) => null),
              PageInfo('对话框', (context) => null),
            ]),
          ),
          ExpansionTile(
            title: Text("包与插件"),
            children: _generateItem(context, [
              PageInfo('相机', (context) => null),
              PageInfo('PlatformView示例（Webview）', (context) => null),
            ]),
          )
        ],
      ),
    );
  }
}
