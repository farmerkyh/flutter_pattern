/*
  - factory 패턴을 사용한 소스
  - 이 예제는 factory패턴을 적용한 singleton 패턴이라고 보면 된다.
*/
class Logger {
  final String name;

  //_cache
  // - 생성된 instance의 class name을 key로 갖는 Map이다.
  // - 수행완료시점에 _cache에는 5개(A0~4)의 Map이 존재 한다.
  static final Map<String, Logger> _cache = <String, Logger>{};

  //factory constructor이기에 internal constructor를 호출 할 수 있고 logger를 return할 수 있다.
  //name arg에 다른 name이 들어와도 Logger._insternal() constructor는 한번만 호출 된다.
  //??  여기서 의문점,
  //    . 보통 singleton 패턴에서는 return을 instance를 하는데 이 소스에서는 Map을 return한다.
  //    . instance가 한번만 생성되는걸 보면 singleton 패턴은 맞는데.. ㅋㅋㅋ
  factory Logger(String name) {
    print('arg.name $name');
    return _cache.putIfAbsent(name, () => Logger._insternal(name));
  }

  //singleton 패턴으로 적용된다
  //최초 한번만 생성 된다. (호출된다.)
  //기존 Logger(){} 의 public constructor를 private constructor로 만들었다.
  //Logger instance를 더 이상 직접생성할 수 없다.
  Logger._insternal(this.name) {
    print('New logger create with name ${this.name}');
  }

  void log(String msg) {
    print('${this.name} : $msg');
  }
}

class A {
  late final Logger _logger;
  final String name;
  A(this.name) {
    _logger = Logger(name);
    print('Instance of $name is created');
    print('_logger.name ${_logger.name}');
  }
}

main() {
  for (int i = 0; i < 5; i++) {
    print('Create instance $i');
    A a = A('A$i');
    print('');
  }
}

/*  출력결과
  
Create instance 0
arg.name A0
New logger create with name A0
Instance of A0 is created
_logger.name A0

Create instance 1
arg.name A1
New logger create with name A1
Instance of A1 is created
_logger.name A1

Create instance 2
arg.name A2
New logger create with name A2
Instance of A2 is created
_logger.name A2

Create instance 3
arg.name A3
New logger create with name A3
Instance of A3 is created
_logger.name A3

Create instance 4
arg.name A4
New logger create with name A4
Instance of A4 is created
_logger.name A4
*/
