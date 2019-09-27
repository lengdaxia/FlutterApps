import 'package:flutter/material.dart';


class ImageAndIconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage('assets/images/avatar.png');

    return SingleChildScrollView(
      child: Column(
        children: <Image>[
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          Image(
            image: img,
            width :100 ,
            height: 50,
            fit: BoxFit.cover,
          ),Image(
            image: img,
            width :100 ,
            height: 50,
            fit: BoxFit.fitWidth,
          ),
          Image(
            image: img,
            width :100 ,
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          Image(
            image: img,
            width :100 ,
            height: 50,
            fit: BoxFit.scaleDown,
          ),
          Image(
            image: img,
            width :50 ,
            height: 100,
            fit: BoxFit.none,
          ),
          Image(
            image: img,
            width:100.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            width: 100,
            height: 200,
            repeat: ImageRepeat.repeatY,
          ),
          Image(
            image: img,
            width: 400,
            height: 100,
            repeat: ImageRepeat.repeatX,
          )
        ].map((e){
          return Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: e,
              ),
            ),
            Text(e.fit.toString())
          ],);
        }).toList(),
      ),
    );
  }
}