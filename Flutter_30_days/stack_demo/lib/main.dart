import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Stack Demo',
      home: StackExamplePage(),
    );
  }
}

class StackExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Example'),
      ),
      body: ExampleStack(),
    );
  }
}

class ExampleColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children:[
      Flexible(flex: 2, child: Placeholder(),),
      Flexible(flex: 2, child: Placeholder(),),
      ]
    );
  }
}


class ExampleStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: FlutterLogo(),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: Text('25,25', style: TextStyle(fontWeight: FontWeight.w700),),
            ),
            Positioned(
              bottom: 25,
              right: 25,
              child: Text('(-25, -25)' ,style: TextStyle(fontWeight: FontWeight.w700),),
            ),

            Align(
              alignment: Alignment(0.0,0.0),
              child: Container(
                height: 75.0,
                width: 75.0,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 5),
                  ),
                  child: Center(child: Text(
                    'Center',
                    style: TextStyle(fontWeight: FontWeight.w700)
                  ),),
                  ),
                ),
              ),

            Align(
              alignment: const Alignment(-1.0, -1.0),
              child: Container(
                width: 10,
                height: 10,
                child: Material(
                  shape: CircleBorder(),
                  color: Colors.black,
                ),
              ),
            ),

            Align(
              alignment: const Alignment(1.0, 1.0),
              child: Container(
                width: 20,
                height: 20,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            Align(alignment: Alignment(0.5, -0.5),
                  child: Text('25% in', style: TextStyle(fontWeight:FontWeight.w700)),
            ),

            Align(alignment: Alignment(-0.5, 0.5),
                  child: Text('25% in',
                  style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  ),
                  
        ],
        ),
      ),
    );
  }
}