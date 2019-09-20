import 'package:flutter/material.dart';
// import 'package:super_flutter/routers/application.dart';
import 'home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>{

  FocusNode _emailFocusNode = new FocusNode();
  FocusNode _passworldFocusNode = new FocusNode();
  FocusScopeNode _focusScopeNode =  FocusScopeNode();

  GlobalKey<FormState> _signInFormKey = new GlobalKey();
  TextEditingController _userNameEditingController = new TextEditingController();
  TextEditingController _passwordEditingController = new TextEditingController();

  bool isShowPassword = false;
  String username = '';
  String password = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    try{
      _userNameEditingController.text = "";
      _passwordEditingController.text = "";

    } catch (err){
      print("读取本地用户存储信息出错 $err");
    }
  }

  Widget buildSigninTextForm(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: MediaQuery.of(context).size.width*0.8,
      height: 190,
      child: Form(
        key: _signInFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
                child: TextFormField(
                  controller: _userNameEditingController,
                  focusNode: _emailFocusNode,
                  onEditingComplete: (){
                    if (_focusScopeNode == null){
                      _focusScopeNode = FocusScope.of(context);
                    }
                    _focusScopeNode.requestFocus(_passworldFocusNode);
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Colors.black),
                    hintText: "input username",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value){
                    if(value.isEmpty){
                      return "username is empty";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.75,
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                child: TextFormField(
                  controller: _passwordEditingController,
                  focusNode: _passworldFocusNode,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.black,),
                    hintText: "password",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      color: Colors.black,
                      onPressed: (){
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      }),
                    ),
                    obscureText: !isShowPassword,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "password can not be empty";
                      }
                      return null;
                    },
                    onSaved: (value){
                      setState(() {
                        password = value;
                      });
                    },
                  ),   
                ),
              ),
            Container(height: 1,width: MediaQuery.of(context).size.width*0.75,color: Colors.grey[400],),
          ]
        ),
      ),
    );
  }

  buildSignInButton(){
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Theme.of(context).primaryColor
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      onTap: (){
        if(_signInFormKey.currentState.validate()){

        }
      },
    );
  }

  doLogin(){
    print("doLogin");
    _signInFormKey.currentState.save();

    setState(() {
      isLoading = true;
    });

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
      return HomePage();
    }), (route) => route == null);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/paimaiLogo.png',
                  ),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomRight,
                 ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 35.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Image.asset('assets/images/gitHub.png',
                           fit: BoxFit.contain,
                           width: 60.0,
                           height: 60.0,
                           ),
                           Image.asset(
                             'assets/images/arrow.png',
                             fit: BoxFit.contain,
                             width: 40,
                             height: 30,
                           ),
                           Image.asset(
                             'assets/images/FlutterGo.png',
                             fit: BoxFit.contain,
                             width: 60.0,
                             height: 60.0,
                           ),
                        ],
                      ),
                      buildSigninTextForm(),
                      buildSignInButton(),
                      SizedBox(height: 15.0),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: Colors.grey[400],
                        margin: const EdgeInsets.only(bottom: 10.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: Text(
                              'Google Sign In',
                              style:TextStyle(color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline)
                            ),
                            onPressed: (){
                              print("Google Sign In");
                            },
                          ),
                          FlatButton(
                            child: Text('Login',style: TextStyle(color: Theme.of(context).primaryColor, decoration: TextDecoration.underline),),
                            onPressed: (){
                              print("点击了登录");
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ,),
        ),
      ),
    );
  }


}