
import 'package:flutter/material.dart';


class ButtonPage extends StatefulWidget {
  @override

  _ButtonPageState createState() => _ButtonPageState();
}


class _ButtonPageState extends State<ButtonPage> {


  void _onPressed() {
    print("pressed");  
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
          child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('RaisedButton'),
                onPressed: (){

                },
              ),
              Divider(),
              FlatButton(
                child: Text('FlatButton'),
                onPressed: (){

                },
              ),
              Divider(),
              OutlineButton(
                child: Text('OutLineButton'),
                onPressed: (){

                },
              ),
              Divider(),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: (){

                },
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text('Send'),
                    onPressed: _onPressed,
                  ),
                  OutlineButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Add'),
                    onPressed: _onPressed,
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.details),
                    label: Text('detail'),
                    onPressed: _onPressed,
                  ),
                ],
              ),
              Divider(),
              FlatButton(onPressed: _onPressed,
                child: Text("Submit"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              ),
              Divider(),
               RaisedButton(onPressed: _onPressed,
                child: Text("Submit"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}