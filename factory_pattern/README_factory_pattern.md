# 1. Factory Pattern 개념
### 1-1 정의
1. 팩토리 메서드 패턴(Factory method pattern)은 객체지향 디자인 패턴이다. 
2. Factory method는 부모(상위) 클래스에 알려지지 않은 구체 클래스를 생성하는 패턴이며. 
3. 자식(하위) 클래스가 어떤 객체를 생성할지를 결정하도록 하는 패턴이기도 하다.

### 1-2 특징
1. static을 사용한 효과가 나 객체를 생성하지 않고도 이 패턴을 사용할 수 있다.
2. factory keyword를 사용하면 클래스에 대한 instance를 생성 시    
  instance가 존재 하면 신규로 instance를 생성하지 않고, 기존 생성된 instance를 넘겨준다.
3. 자신의 서브클래스 인스턴스를 리턴할 수 도 있다.
9. 위와 같은 특징을 이용해서 Singleton Pattern을 구현할 수 있다. (Dart공식문서에 존재)

### 1-3 factory Constructor 특징
1. 자신의 instance를 return하는게 아니고, 서브클래스의 instance를 return할 수 있다.   
  - 이때, return은 서브클래스의 instance이지만, return하는 type은 서브클래스의 type이 아니고 자신의 type이다.
  - 일반, Constructor에서는 자신의 instance만 return할 수 있다.

  //factory 특징
  //  1. 
  //  1. 상위 객체에서 하위 객체 인스턴스를 안다는게 어색하지만 Pizza 클래스에서 SeafoodPizza 클래스의 인스턴스를 반환할 수 있다.
  //  2. factory문법을 사용하면 static 효과와 동일하다. 즉, 객체를 생성하지 않고도 패턴을 사용가능하다.
  //factory 사용이유
  //  1. 소스 수정 시 각페이지에서는 거의 변경 없이 factory를 사용한 객체에서만 변경하면 될 수 있도록 하는 패턴이다.

named constructor
 - 생성자이지만 객체이름하고 다른이름을 부여할 수 있다.

