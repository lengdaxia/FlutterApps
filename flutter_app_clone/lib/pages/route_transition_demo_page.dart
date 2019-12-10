import 'package:flutter/material.dart';

class RouteTransitionPage extends StatefulWidget {
  @override
  _RouteTransitionPageState createState() => _RouteTransitionPageState();
}

class _RouteTransitionPageState extends State<RouteTransitionPage> {
  @override
  Widget build(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: null,
              );
            }));
    return Container();
  }
}
