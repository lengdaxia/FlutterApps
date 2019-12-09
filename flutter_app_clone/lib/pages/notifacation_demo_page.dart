import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var scrollState = "no Scroll";

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            {
              setState(() {
                scrollState = "Scroll started";
              });
              break;
            }
          case ScrollUpdateNotification:
            {
              setState(() {
                scrollState = "Scroll updating";
              });
              break;
            }
          case ScrollEndNotification:
            {
              setState(() {
                scrollState = "Scroll ended";
              });
              break;
            }
          case OverscrollIndicatorNotification:
            {
              setState(() {
                scrollState = "Scroll Over bound";
              });
              break;
            }
        }
      },
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              title: Text(scrollState),
            );
          }
          return ListTile(
            title: Text('$index'),
          );
        },
      ),
    );
  }
}

// 自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class Notification2Page extends StatefulWidget {
  @override
  _Notification2PageState createState() => _Notification2PageState();
}

class _Notification2PageState extends State<Notification2Page> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      onNotification: (noti) {
        setState(() {
          _msg += noti.msg + "  ";
        });
        return true;
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Builder(
              builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification('Hi').dispatch(context),
                  child: Text('Send Notification'),
                );
              },
            ),
            Text(_msg)
          ],
        ),
      ),
    );
  }
}
