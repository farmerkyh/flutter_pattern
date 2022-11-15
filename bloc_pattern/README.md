# Bloc Pattern

## 1. 참조 site
 - 참조 site : https://beomseok95.tistory.com/312
 
## 2. Bloc Pattern 정의
 - Google 개발자가 권장하는 Flutter의 상태 관리 시스템이다.
 - Presentation Layer와 business Logic을 분리하여 코드를 작성할 수 있도록 해준다.
 - 스트림을 이용하여 만들어진다.
 - 위젯은 Sinks (입구)를 통하여 BLoc에 이벤트를 보낸다.
   BLoC객체는 위젯으로부터 이벤트를 전달받으면 필요한 Repository 등으로부터  데이터를 전달받아 business Logic을 처리한다.
   business Logic을 처리한 후, BLoC 객체를 구독 중인 UI 객체들에게 상태를 전달한다.

## 3. Bloc Pattern 특징
 -  UI에서 여러 BLoC이 존재할 수 있다.
 -  UI와 business로직을 분리하여  관리한다.
 -  BLoC은 여러 UI에서 구독할 수 있다. (재사용이 가능하다)
 -  BLoC만을 분리하여 테스트도가 가능하다.

## 4. RxDart를 이용한 BLoC
 - Bloc과 Widget을 바인딩 하는 방법으로  Stream 을 사용할 수 있다.
 - 이 예에서는 편의를 위해  RxDart를 사용하였다.
 - RxDart는이 Stream API 위에 기능을 여러 기능을 추가한 라이브러리 이다.

## 5. Flutter BLoC 라이브러리 클래스들
### a. BlocBuilder 
 - BlocBuilder는 새로운 State를 전달받았을 때 build를 호출하여 widget을 변경한다.
 - StreamBuilder , 혹은 FutureBuilder와 유사하다.
```dart
BlocBuilder<BlocA, BlocAState>(
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```
 - condition 옵션을 이용하여 이전 BLoC의 State와 현재 BLoC의 State를 취하고 bool을 반환한다.
 - condition이 false를 반환하면 builder를 호출하지 않는다.
```dart
BlocBuilder<BlocA, BlocAState>(
  condition: (previousState, state) {
    // return true/false to determine whether or not
    // to rebuild the widget with state
  },
  builder: (context, state) {
    // return widget here based on BlocA's state
  }
)
```
### b. BlocProvider
 - BlocProvider는 child에 Bloc을 제공하는 Flutter widget이다.
 - BLoC의 단일 인스턴스가 서브 트리 내의 여러 위젯에 제공될 수 있도록 종속성 주입 (DI) 위젯으로 사용된다.
```dart
BlocProvider(
  create: (BuildContext context) => BlocA(),
  child: ChildA(),
);
```
 - 서브 트리에서 BLoC을 참조하여 사용하고자 한다면 아래와 같이 사용 가능하다.
```dart
BlocProvider.of<BlocA>(context)
```

### c. MultiBlocProvider
 - MultiBlocProvider는 여러여러 BlocProvider 위젯을 하나로 병합하는 Flutter 위젯이다.
 - BlocProvider를 중첩할 필요가 없다.
```dart
BlocProvider<BlocA>(
  create: (BuildContext context) => BlocA(),
  child: BlocProvider<BlocB>(
    create: (BuildContext context) => BlocB(),
    child: BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
      child: ChildA(),
    )
  )
)
```
 에서
```dart
MultiBlocProvider(
  providers: [
    BlocProvider<BlocA>(
      create: (BuildContext context) => BlocA(),
    ),
    BlocProvider<BlocB>(
      create: (BuildContext context) => BlocB(),
    ),
    BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
    ),
  ],
  child: ChildA(),
)
```
 으로

### d. BlocListener
 - BlocListener는 해당 Bloc의 State가 변경되었을 때 호출되는 위젯이다.
```dart
BlocListener<BlocA, BlocAState>(
  listener: (context, state) {
    // do stuff here based on BlocA's state
  },
  child: Container(),
)
```
 - condition속성을 이용하여 제어도 가능합니다.
```dart
BlocListener<BlocA, BlocAState>(
  condition: (previousState, state) {
    // return true/false to determine whether or not
    // to call listener with state
  },
  listener: (context, state) {
    // do stuff here based on BlocA's state
  }
  child: Container(),
)
```

### e. MultiBlocListener
 - MultiBlocListener는 여러 BlocListener 위젯을 하나로 병합하는 Flutter 위젯이다.
```dart
MultiBlocListener(
  listeners: [
    BlocListener<BlocA, BlocAState>(
      listener: (context, state) {},
    ),
    BlocListener<BlocB, BlocBState>(
      listener: (context, state) {},
    ),
    BlocListener<BlocC, BlocCState>(
      listener: (context, state) {},
    ),
  ],
  child: ChildA(),
)
```

### f. RepositoryProvider
 - RepositoryProvider 는 하위트리의  자식에게 repository를 제공하는 Flutter 위젯이다.
 - 즉 ,서브 트리의 단일 위젯을 여러 위젯에 제공할 수 있도록 종속성 주입 (DI) 위젯으로 사용된다.
 - BlocProvider블록을 제공하는 데 사용해야 하는 반면 RepositoryProvider리포지토리에만 사용해야 한다.
```dart
RepositoryProvider(
  builder: (context) => RepositoryA(),
  child: ChildA(),
);
```
 - 서브 트리에서 아래와 같이 Repository 인스턴스를 검색할 수 있다.
```dart
RepositoryProvider.of<RepositoryA>(context)
```

### g. MultiRepositoryProvider
 - MultiRepositoryProvider는 여러 RepositoryProvider위젯을 하나로 병합하는 Flutter 위젯이다.
```dart
MultiRepositoryProvider(
  providers: [
    RepositoryProvider<RepositoryA>(
      builder: (context) => RepositoryA(),
    ),
    RepositoryProvider<RepositoryB>(
      builder: (context) => RepositoryB(),
    ),
    RepositoryProvider<RepositoryC>(
      builder: (context) => RepositoryC(),
    ),
  ],
  child: ChildA(),
)
```dart

