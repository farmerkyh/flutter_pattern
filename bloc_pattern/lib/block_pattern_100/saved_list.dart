import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'block.dart';

class SavedList extends StatefulWidget {
  final Set<WordPair>? saved;

  SavedList({@required this.saved, super.key});

  @override
  State<SavedList> createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved")),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
        stream: bloc.savedStream,
        builder: (context, snapshot) {
          var saved = Set<WordPair>();
          if (snapshot.hasData) {
            saved.addAll(snapshot.data);
          } else {
            bloc.addCurrentSaved;
          }
          //var saved = snapshot.hasData ? snapshot.data : Set<WordPair>;

          return ListView.builder(
            itemCount: (saved.length) * 2,
            itemBuilder: ((context, index) {
              if (index.isOdd) {
                return Divider();
              } else {
                var realIndex = index ~/ 2;
                return _buildRow((saved.toList())![realIndex]);
              }
            }),
          );
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      onTap: () {
        //setState(() {}
        bloc.addToOrRemoveFromSavedList(pair);
      },
    );
  }
}
