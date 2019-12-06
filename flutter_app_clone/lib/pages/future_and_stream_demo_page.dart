import 'package:flutter/material.dart';


class FutureAndStreamPage extends StatefulWidget {
  @override
  _FutureAndStreamPageState createState() => _FutureAndStreamPageState();
}

class _FutureAndStreamPageState extends State<FutureAndStreamPage> {

  Future<String> f = Future.delayed(Duration(seconds: 3) ,() {
//    throw ArgumentError('错误');
    return "我是从互联网获取的数据";
  });


  Stream<int> counter(){
    return Stream.periodic(Duration(seconds: 1),(i){

      return i;
    });
  }

  @override
  Widget build(BuildContext context) {

  return Center(
    child: StreamBuilder<int>(
      stream: counter(),
        builder: (context, snapshot){
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error.toString()}');
        }else{

          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Text('Stream none');
              case ConnectionState.waiting:
            return Text('Stream waiting');
            case ConnectionState.active:
              return Text('Stream active: ${snapshot.data}');
            case ConnectionState.done:
              return Text('Stream closed');
          }
          return null;
        }
    }),
  );


    return Center(
      child: FutureBuilder(
          future: f,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.connectionState);
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return Text('Error: ${snapshot.error.toString()}');
              } else{
                return Text('Content: ${snapshot.data}');
              }
            }else{
              return CircularProgressIndicator();
            }
          })
    ) ;
  }
}

