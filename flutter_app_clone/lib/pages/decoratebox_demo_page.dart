import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
            borderRadius: BorderRadius.circular(3.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0
              )
            ]
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 18.0 
            ),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white)
            ),
          ),
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              image: DecorationImage(
                image: AssetImage('assets/images/avatar.png')
              )
            ),
          ),
        )
      ],

    );
  }
}