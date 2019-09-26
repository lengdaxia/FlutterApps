import 'package:flutter/material.dart';
import './pages/index_page.dart';
import './config/routers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '大分生活+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        home: IndexPage(),
        routes: appRoutes,
      ),
    );
  }
}