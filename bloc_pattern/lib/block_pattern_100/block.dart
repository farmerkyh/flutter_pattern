import 'dart:async';

import 'package:english_words/english_words.dart';
//import 'dart:async';

class Bloc {
  Set<WordPair> saved = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();
  get addCurrentSaved => _savedController.sink.add(saved);
  //1.
  // Stream<Set<WordPair>> savedStream() {
  //   return _savedController.stream;
  // }
  //2.
  // get savedStream {
  //   return _savedController.stream;
  // }
  //3.  (위 1,2,3 모두 같은 소스)
  get savedStream => _savedController.stream;

  //a. list화면에서 WordPair를 클릭했을 때 호출
  addToOrRemoveFromSavedList(WordPair item) {
    if (saved.contains(item)) {
      saved.remove(item);
    } else {
      saved.add(item);
    }
    //saved값이 변경 되었다고 controller에게 알려준다. (sink)
    _savedController.sink.add(saved);
  }

  //b.

  //close를 해주지 않으면 memory leak이 발생할 수 있음
  void disposet() {
    _savedController.close();
  }
}

var bloc = Bloc();
