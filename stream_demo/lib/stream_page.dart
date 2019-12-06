import 'package:flutter/material.dart';
import 'dart:async';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  int _count = 0;

  final StreamController<int> _streamController = StreamController();

  @override
  void initState() {
    super.initState();

    Stream<String>.fromFuture(getData());
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 5));
    return "return a String";
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: StreamBuilder<int>(
            stream: _streamController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {}
              if (snapshot.data == 18) {
                setState(() {});
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('触发了'),
                ));
                print('触发了条件');
              }
              return snapshot.data == null
                  ? Text('0')
                  : Text('${snapshot.data}');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _streamController.sink.add(++_count);
        },
      ),
    );
  }
}
