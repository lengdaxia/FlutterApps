import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(new NavigationExampleApp());
}

class NavigationExampleApp extends StatelessWidget {

  Route<dynamic> _parseRoute(RouteSettings settings){

    final List<String> path = settings.name.split('/');

    assert(path[0] == '');

    if(path[1] == 'second' && path.length == 3) {

      final value = double.parse(path[2]);

      return new MaterialPageRoute<double>(
        settings: settings,
        builder: (BuildContext context) => new SecondScreenWidget(value: value),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: FirstScreenWidget(),
      // onGenerateRoute: _parseRoute,
    );
  }
}


class FirstScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreenWidget>{
  var _value = 50.0;

  _navigationUsingConstructor() async {

    _value = await Navigator.of(context).push(      
      new MaterialPageRoute(
        builder: (context) => new SecondScreenWidget(value: _value,)
      )
    ) ?? 1.0;
  }

  _navigateUsingRoute() async {
    _value = await Navigator.of(context).pushNamed('/second/$_value') ?? 1.0;
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              min: 1.0,
              max: 100.0,
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: const Text('Pass Via constructor'),
                  onPressed: () {
                    _navigationUsingConstructor();
                  },
                ),
                RaisedButton(
                  child: const Text('Pass Via route'),
                  onPressed: (){
                    _navigateUsingRoute();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SecondScreenWidget extends StatefulWidget{
  SecondScreenWidget({this.value: 1.0});

  final double value;

  @override
  State<StatefulWidget> createState() {
  return SecondScreenState(value);
  }
}

class SecondScreenState extends State<SecondScreenWidget>{
  SecondScreenState(this._value);

  double _value;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: const Text('Second Screen'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Slider(
              min: 1.0,
              max: 100.0,
              value: _value,
              onChanged: (value) => setState(() => _value = value),
            ),

            new RaisedButton(
              child: const Text('Return to First'),
              onPressed: () => Navigator.of(context).pop(_value),
            )
          ],
        ),
      ),
    );
  }
}