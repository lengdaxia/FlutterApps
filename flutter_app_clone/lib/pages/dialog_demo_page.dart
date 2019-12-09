import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* const AlertDialog({
  Key key,
  this.title, //对话框标题组件
  this.titlePadding, // 标题填充
  this.titleTextStyle, //标题文本样式
  this.content, // 对话框内容组件
  this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), //内容的填充
  this.contentTextStyle,// 内容文本样式
  this.actions, // 对话框操作按钮组
  this.backgroundColor, // 对话框背景色
  this.elevation,// 对话框的阴影
  this.semanticLabel, //对话框语义化标签(用于读屏软件)
  this.shape, // 对话框外形
})
* */
class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  bool withTree = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
                onPressed: () async {
                  bool ret = await showDeleteConfirmDialog1();
                  if (ret == null) {
                    print('取消');
                  } else {
                    print('确认删除');
                  }
                },
                child: Text('basic dialog')),
            RaisedButton(
              child: Text('basic diglog2'),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog2();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录");
                }
              },
            ),
            RaisedButton(
              child: Text('basic diglog3'),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog3();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录");
                }
              },
            ),
            RaisedButton(
              child: Text('basic diglog4'),
              onPressed: () async {
                bool delete = await showDeleteConfirmDialog4();
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录");
                }
              },
            ),
            RaisedButton(
              child: Text('change language'),
              onPressed: () {
                changeLanguage().then((value) {
                  print('choose language: $value');
                });
              },
            ),
            RaisedButton(
              onPressed: () async {
                int index = await showListDialog();
                print("点击了：$index");
              },
              child: Text('listview dialog'),
            ),
            RaisedButton(
              onPressed: () {
                showModelBottomSheet();
              },
              child: Text('ModelBottomSheet'),
            ),
            RaisedButton(
              onPressed: () async {
                DateTime time = await showDatePickerDialog();
                print(time.toString());
              },
              child: Text('showDatePickerDialog'),
            ),
            RaisedButton(
              onPressed: () async {
                DateTime time = await showiOSDatePicker();
                print(time.toString());
              },
              child: Text('showiOSDatePicker'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog1() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('您确定要删除吗'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('确定')),
            ],
          );
        });
  }

  Future<DateTime> showDatePickerDialog() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(Duration(days: 365)),
    );
  }

  Future<DateTime> showiOSDatePicker() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              minimumDate: date,
              maximumDate: date.add(Duration(days: 30)),
              maximumYear: date.year + 1,
              onDateTimeChanged: (DateTime value) {
                print(value);
              },
            ),
          );
        });
  }

  Future<bool> showDeleteConfirmDialog2() {
    withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('确定要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录？'),
                    Checkbox(
                      value: withTree,
                      onChanged: (bool value) {
                        setState(() {
                          withTree = !withTree;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
              )
            ],
          );
        });
  }

  Future<bool> showDeleteConfirmDialog3() {
    bool _withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('确定要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录？'),
                    DialogCheckbox(
                      value: _withTree,
                      onChanged: (bool value) {
                        _withTree = !_withTree;
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
              )
            ],
          );
        });
  }

  Future<bool> showDeleteConfirmDialog4() {
    bool _withTree = false;
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('确定要删除当前文件吗？'),
                Row(
                  children: <Widget>[
                    Text('同时删除子目录？'),
                    StatefulBuilder(
                      builder: (context, _setState) {
                        return Checkbox(
                          value: _withTree,
                          onChanged: (bool value) {
                            _setState(() {
                              _withTree = !_withTree;
                            });
                          },
                        );
                      },
                    )
                  ],
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('删除'),
                onPressed: () {
                  Navigator.of(context).pop(withTree);
                },
              )
            ],
          );
        });
  }

  Future<int> showListDialog() async {
    int index = await showDialog(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(
              title: Text('请选择'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('$index'),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                },
              ),
            )
          ],
        );
        return Dialog(child: child);
      },
    );

    if (index != null) {
      print('点击了: $index');
    }
    return index;
  }

  Future<int> showModelBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('$index'),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          );
        });
  }

  Future<int> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('请选择语言'),
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(0);
                },
                child: Padding(
                  child: Text('中文简体'),
                  padding: EdgeInsets.symmetric(vertical: 6),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(1);
                },
                child: Padding(
                  child: Text('English'),
                  padding: EdgeInsets.symmetric(vertical: 6),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(2);
                },
                child: Padding(
                  child: Text('日本語'),
                  padding: EdgeInsets.symmetric(vertical: 6),
                ),
              )
            ],
          );
        });
    return i;
  }
}

class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({Key key, this.value, @required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        // 将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          // 更新自身选中状态
          value = v;
        });
      },
    );
  }
}
