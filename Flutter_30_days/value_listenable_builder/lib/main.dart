import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'valueListenableBuilder Demo',
      home: Scaffold(body: SafeArea(child: HomePage()),),
    );
  }
}

class HomePage  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SimpleValue(),
          SizedBox(height: 25,),
          ComplexValue(),
          SizedBox(height: 25,),
          AnimationValue(),
          SizedBox(height: 25,)
        ]
      ),
    );
  }
}

class SimpleValue extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SimpleValueState();
  }
}

class _SimpleValueState extends State<SimpleValue>{
  final _simpleValue = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ValueListenableBuilder(
          valueListenable: _simpleValue,
          builder: (context, value, _){
            return Text('Value : $value');
          },
        ),
        FlatButton(
          child: Text('Increment'),
          onPressed: ()=> _simpleValue.value ++,
        )

      ],
    );
  }
}

class ComplexValueNotifier extends ValueNotifier<String> {
  ComplexValueNotifier(String value) : super(value);

  int count = 0;

  void addDot() => value = value + '.';

  void addAll(){
    value += '.';
    count += 1;
  }
}

class ComplexValue extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ComplexValueState();
  }
}
class _ComplexValueState extends State<ComplexValue> {
  final _complexValue = ComplexValueNotifier('T \'ve been clicked');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ValueListenableBuilder(
          valueListenable: _complexValue,
          builder: (context,value,_){
            return Text('$value,'+'${_complexValue.count}');
          }),
        FlatButton(
          child: Text('Clicked me'),
          onPressed: () => _complexValue.addAll(),
        )
      ],
    );
  }
}


class AnimationValue extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AnimationValueState();
  }
}
class _AnimationValueState extends State<AnimationValue> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10)
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return ValueListenableBuilder(
        valueListenable: _controller,
        child: Container(width: 100.0, height: 100, color: Colors.green,),
        builder: (context, value, child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * math.pi,
            child: child,
          );
        },
      );
  }
}