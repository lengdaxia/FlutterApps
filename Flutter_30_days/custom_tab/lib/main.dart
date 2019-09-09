import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: TabbedPages(
            tabs: <Widget>[
              Center(child: Text('First Tab'),),
              Center(child: FlutterLogo(size: 200.0,),),
              Center(child: Icon(Icons.ac_unit,size: 200.0,),)
            ],
          ),
        ),
      ),
    );
  }
}

class TabbedPages extends StatefulWidget{
  TabbedPages({this.tabs});
  final List<Widget> tabs;

  @override
  State<StatefulWidget> createState() {
    return _TabbedPagesState();
  }
}

class _TabbedPagesState extends State<TabbedPages> with SingleTickerProviderStateMixin{

  TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: widget.tabs.length, vsync: this);
    _controller.addListener(
      () => setState(()=>{})
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TabBar(
        tabs: <Widget>[
          const Text('First Tab', style: TextStyle(color: Colors.black)),
          const Text('Second Tab', style: TextStyle(color: Colors.black)),
          const Text('Third Tab', style: TextStyle(color: Colors.black)),
        ],
        controller: _controller,
      ),
      Expanded(child: TabBarView(
        children: widget.tabs,
        controller: _controller,
      ),),
      Row(
        children: <Widget>[
          FlatButton(
          child: Row(children: <Widget>[
            Text('Back'),
            Icon(Icons.chevron_left),
          ],),
          onPressed: _controller.index > 0 ? () => _controller.animateTo(_controller.index-1) : null,
          ),
          Expanded(
            child: Center(
              child: TabPageSelector(
                controller: _controller,
                indicatorSize: 10.0,
              ),
            ),
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                const Text('Next'),
                const Icon(Icons.chevron_right),
              ],
            ),
            onPressed: _controller.index < _controller.length - 1 ? ()=> _controller.animateTo(_controller.index + 1): null,
          )
        ],
      )
    ],);
  }
}

