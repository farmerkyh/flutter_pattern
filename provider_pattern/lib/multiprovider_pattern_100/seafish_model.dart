import 'package:flutter/cupertino.dart';

class SeaFishModel with ChangeNotifier {
  final String name;
  int tunaNumber;
  final String size;

  SeaFishModel({required this.name, required this.tunaNumber, required this.size});

  void changeSeaFishNumber() {
    tunaNumber++;

    //------------------------------------------------------------------------------------------
    // . ChangeNotifier내부에 notifyListeners라는 메소드가 존재 한다.
    // . 이 메소드를 호출 하면 ChangeNotifier 클래스를 listen 하고 있는 모든 위젯들에게
    //    Data가 변경 될 때마다 변경 사실을 알려 줄 수 있다.
    // . 그럼 어떻게 하면 변경사실을 알 수 있도록 listen할 수 있을까?  addListener method이용
    //------------------------------------------------------------------------------------------
    notifyListeners();
  }
}
