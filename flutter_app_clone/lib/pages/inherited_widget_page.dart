import 'package:flutter/material.dart';


class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(),
            ),
            RaisedButton(
              child: Text('increment'),
              onPressed: (){
                setState(() {
                  ++count;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget{

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context){
    return context
    .ancestorInheritedElementForWidgetOfExactType(ShareDataWidget)
    .widget;
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print("Dependencies change");
  }
}