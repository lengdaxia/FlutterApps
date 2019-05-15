import 'package:flutter/material.dart';

class StatefullWidgetsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // return CounterWidget();
    // return Text('');
    return new Scaffold(
      appBar: AppBar(
        title: Text('Statefull widget page'),
      ),
      body: new CounterWidget(),
    );
  }
}


class CounterWidget extends StatefulWidget{

  const CounterWidget({
    Key key,
    this.initValue:0
    });

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    return new CounterWidgetState();
  }
}


class CounterWidgetState extends State<CounterWidget>{
  int _counter;
  
  @override
  void initState() {
      super.initState();

      _counter=widget.initValue;
      print('initState');
  } 

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: ()=> setState(()=>++_counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {

    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactive');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('ressemble');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}