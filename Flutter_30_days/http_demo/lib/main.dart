import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(HttpExampleApp());
}

class HttpExampleApp extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: NetWorkBody()),
    );
  }
}

class NetWorkBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Quotation(url:'https://httpbin.org/get'),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          Image.network('https://i.bmp.ovh/imgs/2019/01/76240e4cb69bbb4a.jpg'),
        ],
      ),
    );
  }
}

class Quotation extends StatefulWidget {
  Quotation( {Key key , this.url}) : super(key: key);
  final String url;

  @override
  State<StatefulWidget> createState() {
    return _QuotationState();
  }
}

class _QuotationState extends State<Quotation> {
  String data = 'Loading...';

  @override
  void initState() {
    super.initState();
    
    _get();
  }


  _get() async {
    final res = await http.get(widget.url);
    setState(() {
      data = _parseQuoteFromJson(res.body);
    });
  }

  String _parseQuoteFromJson(String jsonStr) {
    final jsonQuote = json.decode(jsonStr);
    return jsonQuote['origin'];
  }

  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: TextAlign.center);
  }
}
