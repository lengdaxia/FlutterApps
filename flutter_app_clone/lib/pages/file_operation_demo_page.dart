import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class FileOperationPage extends StatefulWidget {
  @override
  _FileOperationPageState createState() => _FileOperationPageState();
}

class _FileOperationPageState extends State<FileOperationPage> {
  int _counter;

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.text');
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    await (await _getLocalFile()).writeAsString('$_counter');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();

    // 初始化的时候读取
    _readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文件操作'),
      ),
      body: Center(
        child: Text('点击了$_counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
