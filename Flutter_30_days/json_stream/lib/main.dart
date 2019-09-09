import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Streamed List Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListExamplePage(),
    );
  }
}

class ListExamplePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ListExamplePageState();
  }
}
class _ListExamplePageState extends State<ListExamplePage> {

  StreamController<Photo> photoStreamController;
  var photoList = <Photo>[];

  @override
  void initState() {
    super.initState();
    photoStreamController = new StreamController<Photo>.broadcast();

    photoStreamController.stream.listen(
      (photo) => setState( () => photoList.add(photo))
    );

    loadPhotos(photoStreamController);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streamed List Example'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int pos) => _getRow(pos) ,
      ),
    );
  }

  Widget _getRow(int pos) {

    if(pos >= photoList.length){
      return null;
    }
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(photoList[pos].title),
            Image.network(photoList[pos].thubnailUrl),
            SizedBox(height: 5),
            Divider(height: 2,color: Colors.grey,),
          ],
        ),
      ),
      
    );
  }

  @override
  void dispose() {
    super.dispose();
    photoStreamController.close();
    photoStreamController = null;
  }
}


loadPhotos(StreamController<Photo> photoStreamController) async {
  String uri = 'https://jsonplaceholder.typicode.com/photos';
  var client = http.Client();
  var request = http.Request('get',Uri.parse(uri));

  var streamResponse = await client.send(request);

  streamResponse.stream
  .transform(utf8.decoder)
  .transform(json.decoder)
  .expand((eventList)=> eventList)
  .map((photoMap) => Photo.formJsonMap(photoMap))
  .pipe(photoStreamController);
}

class Photo {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thubnailUrl;

  Photo.formJsonMap(Map jsonMap) :
    id = jsonMap['id'],
    albumId = jsonMap['albumId'],
    title = jsonMap['title'],
    url = jsonMap['url'],
    thubnailUrl = jsonMap['thumbnailUrl'];
  
  String toStrinfg() {
    return 'Photo(id $albumId, title: $title)';
  }
}