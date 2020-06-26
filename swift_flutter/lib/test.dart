import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double _alphaValue = 1.0;

  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Column(
        children: <Widget>[
          Stack(children: [
            Expanded(
                child: ListView.builder(
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(10.0), child: Text('$index'));
                    })),
            Opacity(
                opacity: _alphaValue,
                child: Container(child: Center(child: Text('Button'))))
          ]),
          Container(child: Center(child: Text('Button')))
        ],
      ),
    );
  }
}
