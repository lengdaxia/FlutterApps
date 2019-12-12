import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('获取百度首页'),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = "请求中";
                      });
                      try {
                        HttpClient httpClient = new HttpClient();

                        HttpClientRequest request = await httpClient
                            .getUrl(Uri.parse('https://www.baidu.com'));

                        request.headers.add("user-agent",
                            'Mozilla/5.0(iPhone; CPU iPhone OS 10_3_1 line Mac OS X) AppleWebKit/603.1.30)(KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1');

                        HttpClientResponse response = await request.close();

                        _text = await response.transform(utf8.decoder).join();

                        print(response.headers);

                        httpClient.close();
                      } catch (e) {
                        _text = "请求失败： $e";
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text(_text.replaceAll(RegExp(r'/s'), "")),
            ),
          ],
        ),
      ),
    );
  }
}
