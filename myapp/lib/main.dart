import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp2());
class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // final wordpair = new WordPair.random();

    return new MaterialApp(
      title:'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.amber,
      ),
      home: new RandomWords(),
      );
    //     new Scaffold(
    //     appBar: new AppBar(
    //       title: Text('My App Bar'),
    //     ),
    //     body: new Center(
    //       // child: new Text('Hello World !'),
    //       // child: new Text(wordpair.asPascalCase),
    //       child:
    //   ),
    // );
  }
}


class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
final _suggestions = <WordPair>[];
final _saved = new Set<WordPair>();

final _biggerfont = const TextStyle(fontSize: 18.0);


  @override
  Widget build(BuildContext context) {
    // final wordpair = new WordPair.random();
    // return new Text(wordpair.asPascalCase);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Start Up Name Generator'),
        actions: <Widget>[
        new IconButton(icon: new Icon(Icons.list),onPressed: _pushSaved),
        ],
      ),
      
      body: _buildSuggestions(),
    );
  }
  
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if(i.isOdd) return new Divider();

        final index = i ~/2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerfont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if (alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles = _saved.map(
              (pair){
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerfont,
                ),
              );
            },
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

}