import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController;
  String tipText = "欢迎光临";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
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
                controller: textController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '水果类型',
                  helperText: '请输入类型'
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: (){
                  _choiceAction();
                },
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
    print('点击了提交了');

    getData(textController.text.toString()).then((value){
        setState(() {
          tipText = value[0]['name'].toString();
        });
    });

    // if(textController.text.toString() == ''){
    //   showDialog(
    //     context: context,
    //     builder: (context){
    //       return AlertDialog(
    //         title: Text('请选择类型'),
    //       );
    //     }
    //   );
    // }else{
    //   getData(textController.text.toString()).then((value){
    //     setState(() {
    //       tipText = value[0]['name'].toString();
    //     });
    //   });
    // }
  }

  Future getData(String text) async {
    try{
      Response res;
      var para = {
        'name':text
      };
      print(para);

      res = await Dio().get(
        "http://127.0.0.1:8000/products/",
      );
      print(res.data);

      return res.data;
    }catch(e){
      print(e);
    }
  }
}

 
