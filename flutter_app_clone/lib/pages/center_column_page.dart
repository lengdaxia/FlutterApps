import 'package:flutter/material.dart';


class CenterColumnPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Hi'),
          Text('World'),
        ],
      ),
    );
  }
}