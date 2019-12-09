import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String _operation = 'No geture detected';

  double _top = 0.0;
  double _left = 0.0;

  double _size = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: Text(_operation, style: TextStyle(color: Colors.white)),
              ),
              onTap: () => updateText('Tap'),
              onDoubleTap: () => updateText('double Tap'),
              onLongPress: () => updateText('long press '),
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: _top,
                    left: _left,
                    child: GestureDetector(
                      child: CircleAvatar(
                        child: Text('A'),
                      ),
                      // onPanDown: (DragDownDetails e) {
                      //   Scaffold.of(context).showSnackBar(SnackBar(
                      //     content: Text('Begin to panDown:${e.globalPosition}'),
                      //   ));
                      // },

                      // onPanEnd: (DragEndDetails e) {
                      //   Scaffold.of(context).showSnackBar(SnackBar(
                      //     content: Text('end to panDown:${e.velocity}'),
                      //   ));
                      // },
                      // 任意方向拖动
                      // onPanUpdate: (DragUpdateDetails e) {
                      //   setState(() {
                      //     _left += e.delta.dx;
                      //     _top += e.delta.dy;
                      //   });
                      // },
                      // // 上下拖动
                      onVerticalDragUpdate: (DragUpdateDetails e) {
                        setState(() {
                          _top += e.delta.dy;
                        });
                      },
                      // 左右拖动(注意，横向和纵向的手势和pan手势是相斥的，不能同时实现)
                      onHorizontalDragUpdate: (DragUpdateDetails e) {
                        setState(() {
                          _left += e.delta.dx;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              height: 300,
              child: Center(
                child: GestureDetector(
                  child: FlutterLogo(
                    size: _size,
                  ),
                  onScaleUpdate: (ScaleUpdateDetails e) {
                    setState(() {
                      _size = 300 * e.scale.clamp(0.8, 10.0);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
