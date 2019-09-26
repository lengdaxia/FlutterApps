import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controller = TextEditingController();
  String tipText = "欢迎光临";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('首页表题'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '水果类型',
                  helperText: '请输入类型'
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: _choiceAction,
                child: Text('选择完毕'),
              ),
              Text(
                tipText
              ),
            ],
          ),
        )
      ),
    );
  }

  void _choiceAction(){
    Navigator.pushNamed(context, 'detail');
    return;

    print("点击了提交了 ${this._controller.text} ");

    if(this._controller.text.toString() == ''){
      print("输入文字为空");
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('请选择类型'),
          );
        }
      );
    }else{
      print("请求网络");
       getData(this._controller.text).then( (value){
        setState(() {
          final modelList = json.decode(value);
          tipText = modelList[0]['fields']['name'];
          
          Navigator.pushNamed(context, 'detail');
        });
        }
      );
    }
  }

  Future getData(String text) async {
    try{
      Response res;
      var para = {
        'name':text
      };
      res = await Dio().get(
        "http://127.0.0.1:8000/products/",
      );
      return res.data;
    }catch(e){
      print(e);
    }
  }

  Future postData() async{
    try{
      Response res;
      Dio dio = Dio();
      dio.options.headers = {};
      res = await dio.get('');
      return res.data;

    }catch(e){
      print(e);
    }
  }
}

 
