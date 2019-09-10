import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class Incrementer with ChangeNotifier{
  Incrementer([this._incrementValue = 1]);
  int _incrementValue;
  int __counter = 0;

  int get counter => __counter;

  int get incrementValue => _incrementValue;

  set incrementValue(int value) {
    _incrementValue = value;
    notifyListeners();
  }

  void increment(){
    __counter += _incrementValue;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    notifier: Incrementer(),
    child: MaterialApp(
      title: 'Bottom_model_sheet',
      home: MyHomePage(title: 'Model Bottom Sheet Demo'),
    ),
    );
  }
}
class MyHomePage extends StatelessWidget{
  MyHomePage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('You have pushe the button this many times:'),
          Consumer<Incrementer>(
            builder: (context, value) {
              return Text('${value.counter}',style: Theme.of(context).textTheme.display1,);
            },
          )
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Provider.of<Incrementer>(context).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}

class BottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      child: Row(children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 20.0),
        child: IconButton(
          icon: Icon(Icons.settings,color: Theme.of(context).canvasColor,),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) => CustomBottomSheet(),
          ),
        ),
        )
      ],),
    );
  }
}



class CustomBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 25.0),
            child: Text('Setting', style: Theme.of(context).textTheme.headline,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Increment Value',
                    style: Theme.of(context).textTheme.body1),
                ),
                CustomSlider()
              ],
            ),
          )
        ],
      ),
    );
  }
}


class CustomSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<Incrementer>(builder:(context, incrementer){
      return Row(children: <Widget>[
        Expanded(child: Slider(
          value: (incrementer.incrementValue.toDouble()),
          min: 1.0,
          max: 10.0,
          label: 'Increment Step',
          onChanged: (double value) => incrementer.incrementValue = value.toInt(),
        ),),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Container(
            width: 30,
            child: Text('${incrementer.incrementValue}'),),
        )
      ],);
    });
  }
}
