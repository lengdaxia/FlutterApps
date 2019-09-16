import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(
    BottomAsYouShouldWriteIt(
       RichText(
        text: TextSpan(
          text: '你好，Flutter',
          style: TextStyle(
            fontSize: 48,
            color: Color(0xffffffff),
          )
        ),
        textDirection: TextDirection.ltr,
      ),
    )
  );
}

class Bottom extends SingleChildRenderObjectWidget{
  const Bottom({Key key, Widget child}):super(key: key, child:child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPositionedBox(
      alignment: Alignment.bottomCenter,
      textDirection: Directionality.of(context),
    );
  }
}

// 另外一种typical way for creating layout widgets;
class BottomAsYouShouldWriteIt extends StatelessWidget{
  BottomAsYouShouldWriteIt(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}