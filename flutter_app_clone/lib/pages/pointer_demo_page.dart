import 'package:flutter/material.dart';

class PointerPage extends StatefulWidget {
  @override
  _PointerPageState createState() => _PointerPageState();
}

class _PointerPageState extends State<PointerPage> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(300.0, 200.0)),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          onPointerDown: (event) {
            setState(() {
              _event = event;
            });
            // Scaffold.of(context).showSnackBar(SnackBar(
            //   content: Text('0 ${event.toString()}'),
            // ));
          },
          onPointerMove: (event) => setState(() {
            _event = event;
          }),
          onPointerUp: (event) => setState(() {
            _event = event;
          }),
        ),
        Listener(
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(Size(200.0, 100.0)),
            child: Center(
              child: Text('左上角200*100范围内非文本区域点击'),
            ),
          ),
          onPointerDown: (event) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('1 ${event.toString()}'),
            ));
          },
          behavior: HitTestBehavior.translucent,
        ),
        Center(
          child: Text('${_event.toString()}'),
        ),
      ],
    );
  }
}
