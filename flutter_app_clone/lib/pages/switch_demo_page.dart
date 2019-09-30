import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {

  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (value){
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Text( _switchSelected? "关": "开"),
            Switch(
              value: !_switchSelected,
              onChanged: (value){
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Text( _switchSelected? "开": "关"),
            
          ],
        ),
        Row(
          children: <Widget>[

            Checkbox(
              value: _checkboxSelected,
              onChanged: (value){
                setState(() {
                  _checkboxSelected =  value;
                });
              },
            ),
            Text('未选中'),
            Checkbox(
              value: !_checkboxSelected,
              onChanged: (value){

              },
            ),
            Text("选中"),
          ],
        )
      ],
    );
  }
}