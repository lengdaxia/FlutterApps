import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BarChart(),
    );
  }
}

class BarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BarChartState();
  }
}

class _BarChartState extends State<BarChart> {
  var barHeights = <int>[];
  @override
  void initState() {
    super.initState();

    _fetchBarHeight();
  }

  _fetchBarHeight() async {

    final heights = await rootBundle.loadStructuredData<List<int>>('assets/barchart.json', (jsonStr) async {
      final jsonList = json.decode(jsonStr);
      return (jsonList as List).map((i) => (i as int)).toList();
    });

    setState(() {
      barHeights = heights;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bar chart demo'),
      ),
      backgroundColor: Colors.white,
      body: Center(
      child: CustomPaint(
        painter: BarChartPainter(barHeights),
      ),
    ) ,
    );
    return 
     Center(
      child: CustomPaint(
        painter: BarChartPainter(barHeights),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  BarChartPainter(this.barHeights);
  final List<int> barHeights;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    
    var pos = 0.0;

    barHeights.forEach((barHeight) {
      canvas.drawRect(Rect.fromLTWH(pos, 10, 10, -barHeight.toDouble()), paint,);
      pos += 12;
    });

  }

  @override
  bool shouldRepaint(BarChartPainter old) =>
    !(new ListEquality().equals(old.barHeights, barHeights));

}
