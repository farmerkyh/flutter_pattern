class SingletonModel {
  int count = -1;
  static final SingletonModel _instance = SingletonModel._internal();

  factory SingletonModel(String step) {
    print('$step-Singleton factory');

    //_instance 를 return은 하지만, SingletonModel._internal() method는 한번만 호출 된다.
    return _instance;
  }

  //클래스가 최초 생성될때 1회 발생
  SingletonModel._internal() {
    count = 0;
    print('Singleton was created');
  }
}

class Normal {
  int count = -1;
  Normal() {
    count = 0;
    print('Normal class was create');
  }
}

void main() {
  /*
    * Singleton 패턴이란
      - 객체의 인스턴스가 오직 하나만 생성되는 것이다.
      - 즉 여러개의 생성자를 호출 하더라도 실제로 생성되는 인스턴스는 하나이다.
  */
  print('1. object create----------------');
  var nOne = Normal(); //첫 번째 일반 클래스 생성
  var nTwo = Normal(); //두 번째 일반 클래스 생성

  var one = SingletonModel('first'); //첫 번째 싱글톤 클래스 생성
  //두 번째 싱글톤 클래스 생성
  // - 이미 클래스가 생성되었기 때문에 인스턴스만 넘겨준다.
  //   또한 초기화 코드도 실행되지 않는다.
  var two = SingletonModel('second');

  // 최초 각 클래스의 count값 출력
  print('\n2. 초기값 출력----------------');
  print('normal one: ${nOne.count}, two: ${nTwo.count}');
  print('singleton one: ${one.count}, two: ${two.count}');

  // 각 클래스의 count값 1씩 증가
  one.count++;
  two.count++;
  nOne.count++;
  nTwo.count++;

  // 다시 한번 각 클래스의 count값 출력
  print('\n3. count ++ 후 출력----------------');
  print('normal one: ${nOne.count}, two: ${nTwo.count}');
  print('singleton one: ${one.count}, two: ${two.count}');

  // 클래스가 같은 인스턴스 인지 확인
  print('\n4. identical를 이용해서 instance 비교 ----------------');
  print('is normal class same: ${identical(nOne, nTwo)}');
  print('is singleton class same: ${identical(one, two)}');
}

/* 위 결과
0. 참고URL : https://m.blog.naver.com/chandong83/221883268902
           : https://betrider.tistory.com/entry/flutter-singleton
           : https://fronquarry.tistory.com/4

1. object create----------------
Normal class was create
Normal class was create
first-Singleton factory
Singleton was created           <- 싱글톤은 1회만 초기화 코드에 진입한 것을 알수 있다.
second-Singleton factory

2. 초기값 출력----------------
normal one: 0, two: 0
singleton one: 0, two: 0

3. count ++ 후 출력----------------
normal one: 1, two: 1
singleton one: 2, two: 2

4. identical를 이용해서 instance 비교 ----------------
is normal class same: false
is singleton class same: true
*/