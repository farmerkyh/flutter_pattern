import 'package:flutter/foundation.dart';

class Dog with ChangeNotifier {
  String name;
  String breed;
  int age;
  Dog({
    required this.name,
    required this.breed,
    this.age = 1,
  });

  void grow() {
    age++;
    name = 'dog05 _ $age';
    breed = 'bread05 _ $age';
    notifyListeners();
  }
}
