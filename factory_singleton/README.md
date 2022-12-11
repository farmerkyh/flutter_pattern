# 1. Singleton 개념
### 1-1 정의
 1. 싱글톤 패턴이란 클래스의 인스턴스를 프로그램 내에서 오직 하나만 생성하도록 제한하는 패턴 이다.

### 1-2 구현방법
 1. class의 static(정적) member변수를 선언 후 instance를 할당해준다.
 2. 생성자에 대한 접근을 제한한다.
 3. instance를 return해주는 method를 구현한다.

### 1-3 Singleton Syntax
```dart
class Singleton {
  // Private한 생성자 생성
  Singleton._privateConstructor();

  // 생성자를 호출하고 반환된 Singleton 인스턴스를 _instance 변수에 할당
  static final Singleton _instance = Singleton._privateConstructor();

  // Singleton() 호출시에 _instance 변수를 반환
  factory Singleton() {
    return _instance;
  }
}
```

### 1-4 용어설명
 1. static   
    - 변수 또는 메서드가 인스턴스에 귀속되는 것이 아닌 클래스에 귀속되는 것
 2. factory
    - factory의 경우 Dart에서 제공해주는 다소 특이한 키워드인데, 결국 `생성자`이다.
    - 하지만 기존의 생성자와는 달리 반환값에 있어서 새로운 인스턴스의 생성이 가능하므로 좀 더 유연한 프로그래밍을 가능하게 한다.
    - 위의 말은 같은 데이터 타입을 가지면 해당 인스턴스를 모두 return 할수 있다는 이야기이다.
    - 예를 들면 factory가 선언된 클래스를 상속받은 자식 클래스의 인스턴스 또한 return이 가능하다.
 3. `Singleton._privateConstructor();` 생성자
    - 흔히 프로그래밍에서 이름(); 는 호출만을 의미하는 경우가 많기 때문에 혼동이 발생하게 되는 것이다.
    - 결론부터 말하자면 Singleton._privateConstructor(); 이것은 호출이 아니라 생성자를 만드는 선언부이다.
    - 빈생성자를 만드는 선언으로 이를 풀어서 표현하면 아래와 같다.
      ```dart
          SingletonOne._privateConstructor() {
                
          }
      ```
    - 참고로 클래스이름 뒤에 생성자 이름은 무엇이 와도 상관없다. 
    - 예를 들어 Singleton.someConstructor(); 이렇게 아무 이름이나 적어줘도 상관 없다.
    - 그렇다면 왜 이렇게 굳이 빈 생성자를 생성하는 것일까?    
      * Dart에선 생성자가 없을경우 자동으로 Public한 생성자를 만들어 버린다. 
      * 이를 막기위해 Private한 생성자를 만들어줘서 자동으로 만들어주는 생성자가 생성 되지 않도록 방지하는 것이다.
      * Dart에서 언더바(‘_’) 를 붙이게 되면 Private을 의미한다.
 4. `static final Singleton _instance = Singleton._privateConstructor();`
    - 생성자를 호출하는 것으로 호출한 결과의 인스턴스를 _instance 변수에 할당한 것이다.



