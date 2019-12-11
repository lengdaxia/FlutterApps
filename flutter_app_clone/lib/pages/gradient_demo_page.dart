import 'package:flutter/material.dart';
import 'package:flutter_app_clone/widgets/gradient_button.dart';

class GradientButtonPage extends StatefulWidget {
  @override
  _GradientButtonPageState createState() => _GradientButtonPageState();
}

class _GradientButtonPageState extends State<GradientButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GradientButton(
            colors: [Colors.lightGreen, Colors.green[700]],
            height: 50.0,
            child: Text('Submit'),
          ),
          GradientButton(
            colors: [Colors.green, Colors.red],
            height: 50.0,
            child: Text('Submit'),
          ),
          GradientButton(
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            height: 50.0,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  onTap() {
    print("button clicked");
  }
}
