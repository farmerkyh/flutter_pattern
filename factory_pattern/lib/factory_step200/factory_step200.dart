/*
  - factory 패턴을 사용하지 않은 소스
*/
class Logger {
  final String name;
  Logger(this.name) {
    print('New logger create with name $name');
  }
  void log(String msg) {
    print('$name : $msg');
  }
}

class A {
  late final Logger _logger;
  final String name;
  A(this.name) {
    _logger = Logger('A');
    print('Instance of $name is created');
  }
}

main() {
  for (int i = 0; i < 5; i++) {
    print('Create instance $i');
    A a = A('A$i');
    print('');
  }
}

/* 출력결과

Create instance 0
New logger create with name A
Instance of A0 is created

Create instance 1
New logger create with name A
Instance of A1 is created

Create instance 2
New logger create with name A
Instance of A2 is created

Create instance 3
New logger create with name A
Instance of A3 is created

Create instance 4
New logger create with name A
Instance of A4 is created

*/