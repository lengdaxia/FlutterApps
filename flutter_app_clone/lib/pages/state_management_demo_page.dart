import 'package:flutter/material.dart';


class BoxOne extends StatefulWidget {
  @override
  _BoxOneState createState() => _BoxOneState();
}


class _BoxOneState extends State<BoxOne> {

  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: _handleTap,
      ),
    );
  }
}
