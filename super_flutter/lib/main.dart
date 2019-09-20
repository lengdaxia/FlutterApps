import 'package:flutter/material.dart';
import 'routers/application.dart' show Application;
import 'pages/login_page.dart';

void main(List<String> args)  {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  MyApp() {
    // final router = new Router();
    Application.env;
  }




  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {
  bool _isLogin = false; //是否登录
  bool _isLoading = true; //是否在加载中

  int themeColor = 0xFFC91B3A;
  List notificationList = [];

  // _MyAppState(){
  //     // TODO: do some init
  // }

  @override
  void initState() {
    super.initState();
    // 1 检查开关
      _checkInfo();
    // 2 开启推送
      _startMessagePush();

    // 推送的相关设置

    // 数据库初始化

    // 本地数据库字段 检查是否登录

    // event事件循环
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'SuperFlutter',
      theme: ThemeData(
        primaryColor: Color(this.themeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0)),
        iconTheme: IconThemeData(
          color: Color(this.themeColor),
          size: 35.0,
         ),
      ),
      home: Scaffold(
        body: showWelcomPage(),
      ),
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: Application.router.generator,
      // navigatorObservers: <NavigatorObserver>[Anay],
    );
  }

  showWelcomPage(){

    return LoginPage();


  // if(_isLoading){
  //     return Container(
  //       color: Color(this.themeColor),
  //       child: Center(
  //         child: FlutterLogo(size: 300,),),
  //     );
  //   } else{
  //     if (_isLogin){
  //       // 进入 AppPage(_userInfo);
  //       return null;
  //     }else{
  //       return LoginPage();
  //     }
  //   }
  }
}

void _checkInfo() async{
  print('检查相关信息');
}

void _startMessagePush() async{
  print("初始化push");
  // 这里使用firebase_messaging 来进行推送
  print("初始化成功");
}

