import 'package:flutter/material.dart';

class AnimatedSwitcherCounterPage extends StatefulWidget {
  const AnimatedSwitcherCounterPage({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterPageState createState() =>
      _AnimatedSwitcherCounterPageState();
}

class _AnimatedSwitcherCounterPageState
    extends State<AnimatedSwitcherCounterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget widget, Animation<double> animation) {
              return ScaleTransition(
                child: widget,
                scale: animation,
              );
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          RaisedButton(
            child: const Text('+1'),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          )
        ],
      ),
    );
  }
}
