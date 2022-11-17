import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'saved_list.dart';

class RandomList extends StatefulWidget {
  const RandomList({super.key});

  @override
  State<RandomList> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    final randomWord = WordPair.random();

    return Scaffold(
      appBar: AppBar(
        title: Text('naming app'),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SavedList(saved: _saved)));
                setState(() {});
              },
              icon: Icon(Icons.list))
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    //ListView.builder
    //  - item간 중간에 line이 존재 한다.
    //    이 line또한 하나의 widget이고, index가 존재 한다.
    //itemBuilder -> index
    //    0, 2, 4, 6, 8 ... = real items
    //    1, 3, 5, 7, 9 ... = dividers
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider();
        }
        var readIndex = index ~/ 2; //~/ : 몫 구하기

        //_suggestions List에 10개씩 영문단어를 추가 시킨다.
        if (readIndex >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[readIndex]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
