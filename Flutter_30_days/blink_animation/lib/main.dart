import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Blink(child: Text('Fader',style: TextStyle(fontSize: 32),),
      duration: Duration(milliseconds: 1000),),
    );
  }
}

class Blink extends StatefulWidget{
  Blink({this.child,this.duration});

  final Widget child;
  final Duration duration;

  @override
  State<StatefulWidget> createState() {
    return _BlinkState();
  }
}

class _BlinkState extends State<Blink> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(duration: widget.duration, vsync: this);
    final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 1.0,end: 0.0).animate(curve);
    animation.addStatusListener((statue) {
      if(statue == AnimationStatus.completed){
        controller.reverse();
      }else if(statue == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PauseText(
          'Hello World',
          maxScale: 3.0,duration: Duration(milliseconds: 500),
        ),
        // child: FadeTransition(
        //   opacity: animation,
        //   child: widget.child,
        // ),
      ),
    );
  }
}


class PauseText extends StatefulWidget{
  PauseText(this.text, {this.maxScale, this.duration});

  final String text;
  final double maxScale;
  final Duration duration;

  @override
  State<StatefulWidget> createState() {
    return _PauseTextState();
  }
}

class _PauseTextState extends State<PauseText> with SingleTickerProviderStateMixin{
  AnimationController controller;
  double textScale = 1.0;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(duration: widget.duration, vsync: this);
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    final animation = new  Tween<double>(begin: 1.0,end: 3.0).animate(curve)
    ..addStatusListener((status){
      if(status == AnimationStatus.completed){
          controller.reverse();
      }else if(status == AnimationStatus.dismissed) controller.forward();
      }
    );

    animation.addListener(()=> setState( ()=> textScale = animation.value));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textScaleFactor: textScale,
    );
  }
}