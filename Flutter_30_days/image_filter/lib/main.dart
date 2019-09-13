import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Image filter demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('image filter'),
        ),
        body: null,
      ),
    );
  }
}

class HomePgae extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final blurFilter = BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(color: Colors.black.withOpacity(0),),
    );

    final matrixFilter = BackdropFilter(
      filter: ImageFilter.matrix(Matrix4.skew(0.5, 0.0).storage),
      child: Container(
        color: Colors.black.withOpacity(0.0),
      ),
    );

    final image = FadeInImage.memoryNetwork(
      fit: BoxFit.fill,
      placeholder: Uint8List(0),
      image: 'https://flutter.io/images/catalog-widget-placeholder.png',
    );

    final stretchedImage = Row(children: <Widget>[Expanded(child: image,)],);

    final logo = FlutterLogo(size: 50,);

    final bluredImage = Stack(
      children: <Widget>[
        stretchedImage,
        Positioned.fill(child: matrixFilter,)
      ],
    );

    final partiallyBlurredImage = Stack(
      children: <Widget>[
        stretchedImage,
        Positioned(
          top: 150,
          bottom: 10,
          left: 10,
          right: 10,
          child: blurFilter,
        ),
      ],
    );

    return Center(child: bluredImage,);
  }
}