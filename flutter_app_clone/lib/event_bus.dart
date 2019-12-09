import 'package:flutter/material.dart';

typedef void EventCallback(arg);

class EventBus {
  // 私有构造函数
  EventBus._internal();

// 保存单例
  static EventBus _singleton = new EventBus._internal();

// 工厂构造方法
  factory EventBus() => _singleton;

// 保存事件订阅者队列,
  var _emap = new Map<Object, List<EventCallback>>();

  // 添加订阅者 key: 事件名id， value ：对应事件队列的订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;

    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add((f));
  }

  // 移除订阅者
  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

// 触发事件，通知所有订阅者
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;

    // 反向遍历，防止订阅者在回调中移除自身带来的下表错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var bus = new EventBus();

  @override
  void initState() {
    super.initState();

    bus.on('login', (arg) {
      print('$arg');
    });
  }

  @override
  void dispose() {
    bus.off('login');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bus.emit('login', 'hello args');

    return Container();
  }
}
