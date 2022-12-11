# 1. Singleton 개념
### 1-1 정의
 1. 싱글톤 패턴이란 클래스의 인스턴스를 프로그램 내에서 오직 하나만 생성하도록 제한하는 패턴 이다.

### 1-2 사용처 예
 1. 로컬 저장소를 나타내는 클래스가 필요시
 2. 싱글톤 패턴은 모든 Firebase 플러그인에서 사용된다. 그리고 메소드를 호출하는 유일한 방법은 instancegetter를 사용하는 것이다.

### 1-3 단점
 1. 테스트하기가 어렵다.

### 1-4 구현방법
 1. class의 static(정적) member변수를 선언 후 instance를 할당해준다.
 2. 생성자에 대한 접근을 제한한다.
 3. instance를 return해주는 method를 구현한다.

# 2. Singleton Syntax
  ```dart
  class Singleton {
    // Private한 생성자 생성
    Singleton._privateConstructor();

    // 생성자를 호출하고 반환된 Singleton 인스턴스를 _instance 변수에 할당
    static final Singleton _instance = Singleton._privateConstructor();

    // Singleton() 호출시에 _instance 변수를 반환
    // 이 factory Singleton(){} method는 생성자가 아니고, 생성자를 return하는 method이다.
    factory Singleton() {
      return _instance;
    }
  }
  ```

### 2-1 Singleton Syntax - Static
 1. 변수 또는 메서드가 인스턴스에 귀속되는 것이 아닌 클래스에 귀속되는 것
 2. `static final Singleton _instance = Singleton._privateConstructor();`
    - 생성자를 호출하는 것으로 호출한 결과의 인스턴스를 _instance 변수에 할당한 것이다.

### 2-2 Singleton Syntax - factory
 1. factory 정의 0
    - 클래스에 대한 instance를 생성 시    
      instance가 존재 하면 신규로 instance를 생성하지 않고,     
      기존 생성자를 사용할 때 factory 키워드를 사용한다.

 2. factory 정의1
    - factory의 경우 Dart에서 제공해주는 다소 특이한 키워드인데, 결국 `생성자`이다.
    - 하지만 기존의 생성자와는 달리 반환값에 있어서 새로운 인스턴스의 생성이 가능하므로 좀 더 유연한 프로그래밍을 가능하게 한다.
    - 위의 말은 같은 데이터 타입을 가지면 해당 인스턴스를 모두 return 할수 있다는 이야기이다.
    - 예를 들면 factory가 선언된 클래스를 상속받은 자식 클래스의 인스턴스 또한 return이 가능하다.
    - 해당 클래스의 동일한 인스턴스를 반환한다는 것 factory이다. 생성자 덕분에 Dart에서 싱글톤 패턴을 구현하는 것은 가능할 뿐만 아니라 간단하고 유연하다.

  3. factory 정의2
    - 전에 이미 생성된 인스턴스가 있다면 원래 값을 return하여 재사용한다.
    - 하나의 클래스에서 하나의 인스턴스만을 사용한다.
    - 서브 클래스를 리턴할 때 사용할 수 없다.
    - factory생성자에서는 this에 접근할 수 없다

### 2-3 Singleton Syntax - Private 생성자
 1. `Singleton._privateConstructor();` 생성자
    - 흔히 프로그래밍에서 이름(); 는 호출만을 의미하는 경우가 많기 때문에 혼동이 발생하게 되는 것이다.
    - 결론부터 말하자면 Singleton._privateConstructor(); 이것은 호출이 아니라 생성자를 만드는 선언부이다.
    - 빈생성자를 만드는 선언으로 이를 풀어서 표현하면 아래와 같다.
    - 생성자를 비공개 함으로써 클래스가 정의된 파일 외부에서 클래스를 인스턴스화할 수 없도록 한다 .
    - 결과적으로 액세스할 수 있는 유일한 방법은 Singleton.instance코드를 호출하는 것이다.

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

# 3. 개발 소스
 - [소스 1](./lib/singleton_step100/singleton_step100.dart)
 - [소스 2](./lib/singleton_step100/singleton_step110.dart)




# 다음공부 과제
 named factory
 named generative
   - ttps://velog.io/@juni416/FlutterFactory-싱글톤과-관련되어-설명
   - https://roseline.oopy.io/dev/flutter-tips/what-is-factory
   - https://another-light.tistory.com/77
   - https://medium.com/nerd-for-tech/named-constructor-vs-factory-constructor-in-dart-ba28250b2747



# 9. 참고URL
 - https://m.blog.naver.com/chandong83/221883268902
 - https://betrider.tistory.com/entry/flutter-singleton
 - https://fronquarry.tistory.com/4
 - https://medium.com/flutter-seoul/dart에서-singleton-pattern사용하기-2312616bbb7e
 - https://codewithandrea.com/articles/flutter-singletons/#how-to-implement-a-singleton-in-dart