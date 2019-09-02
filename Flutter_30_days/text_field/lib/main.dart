import 'package:flutter/material.dart';

void main() {
  runApp(TextFieldExampleApp());
}

class TextFieldExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: 'Flutter Multi-line Text Field Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: const Text('Text Fields'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleLineTextfieldWidget(),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MultiLineTextFieldAndButtonWidget(),
              )
            ],
          ),
        ),
      );
  }
}

class SingleLineTextfieldWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: TextField(
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Enter text; return submit',
        ),
        onChanged: (str)=> {
          print('Single-line text change: $str')
        },
        onSubmitted: (str) => _showInSnackBar(context,'$str'),
      ),
    );
  }
}

class MultiLineTextFieldAndButtonWidget extends StatefulWidget {
  MultiLineTextFieldAndButtonWidget({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MuiltiLineTextFieldAndButtonState();
  }
}

class _MuiltiLineTextFieldAndButtonState extends State<MultiLineTextFieldAndButtonWidget> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: 'Enter Text; return doesn\'t submit'
            ),
            onChanged: (str) => {
              print('Mutil-line text change: $str'),
            },
            onSubmitted: (str) => {
              print('This will not get called when return is pressed'),
            },
          ),
          SizedBox(height: 10.1,),
          FlatButton(
            onPressed: ()=> _showInSnackBar(context, '${_controller.text}'),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

}




_showInSnackBar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(text),
  ));
}