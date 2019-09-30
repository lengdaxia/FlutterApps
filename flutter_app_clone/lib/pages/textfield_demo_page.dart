import 'package:flutter/material.dart';



class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}



class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();

    _passwordController.addListener((){
      print(_passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (text){
                print("您的用户名是：$text");
              },
              onSubmitted: (text){
                print("您提交的用户名是：$text");
              },
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "输入您的登录密码",
                prefixIcon: Icon(Icons.lock),
              ),
            )
          ],
        ),
      ),
    );
  }
}