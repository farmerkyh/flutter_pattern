class DataStore {
  static final Map<String, dynamic> _items = <String, dynamic>{};
  static final DataStore _cache = DataStore._internal();

  //생성자를 factory로 지정
  //플러터에서는 생성자에 factory로 선언하는 것만으로 편리하게 팩토리 메소드를 구현하는 것이 가능하다.
  factory DataStore() {
    return _cache;
  }

  //또 다른 생성자로 named constructor인 DataStore._internal를 만들어 줌으로
  //외부에서는 호출이 되지 않지만
  //정적 맴버인 _cache가 생성될때 named constructor를 호출해 사용하고 있다.
  //_(언더바)로 시작되는 이름은 외부에서 사용할 수 없음을 의미한다.
  //외부에서는 DataStore 팩토리메소드를 호출하는 것으로 유일한 클래스의 인스턴스가 리턴 될 것이다.
  DataStore._internal();

  set(String key, dynamic data) => _items[key] = data;
  get(String key) => _items[key];
}

/*
   @ 싱글턴
     - 싱글톤 패턴이란 클래스의 인스턴스를 프로그램 내에서 오직 하나만 생성하도록 제한하는 패턴 이다.
     - 구현방법
        1. 클래스의 정적 멤버를 선언 후 인스턴스를 할당해준다.
        2. 생성자에 대한 접근을 제한한다.
        3. 인스턴스를 리턴해주는 메소드를 구현한다.
*/
void main() {
  DataStore data1 = DataStore();
  data1.set('id', '1');
  data1.set('name', 'appleJam');

  print(data1.get('id'));
  print(data1.get('name'));

  DataStore data2 = DataStore();
  print(data2.get('id'));
  print(data2.get('name'));
}

/* 위 결과
   참고URL : https://fronquarry.tistory.com/4
            https://medium.com/flutter-seoul/dart에서-singleton-pattern사용하기-2312616bbb7e

//data1 객체와 data2 객체가 동일한 객체임으로 같은 값을 출력하게 된다.

1
appleJam
1
appleJam   
*/
