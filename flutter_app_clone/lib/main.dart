import 'package:flutter/material.dart';
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
      theme: ThemeData(
        primaryColor: Colors.redAccent[300],
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override

  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  void _openPage(BuildContext context, PageInfo page){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      if(!page.withScaffold){
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    })
    );
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page){
      return ListTile(
        title: Text(page.title),
        contentPadding: EdgeInsets.only(left: 30,right: 16),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
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
          )
        ],
      ),
    );
  }
}
