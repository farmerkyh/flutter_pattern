import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int counter = 0;
  String name = '카운터';

  void increment() {
    counter++;
    notifyListeners();
  }
}
