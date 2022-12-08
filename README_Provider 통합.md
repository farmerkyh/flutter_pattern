# 1. Provider
### 1-1 Provider Syntax
```dart
    Provider<T>({
        Key? key,
        required Create<T> create,
        Dispose<T>? dispose,
        bool? lazy,
        TransitionBuilder? builder,
        Widget? child,
    })
```

```dart
    //실사용예)
    class MyApp extends StatelessWidget {
    ......
    Widget build(BuildContext context) {
        return Provider<Dog>(
        create: (context) => Dog(name: 'Sun', breed: 'Bulldog', age: 3),
        lazy: true,
        child: MaterialApp(
            ......
            home: const MyHomePage(),
    ......
    }
```
### 1-2 Provider 정의
 1. 여러 Widget class에서 공통으로 사용되고, 변경되는 값들에 대해서 쉽게 사용할 수 있도록 해주는 Widget이다.
 2. Provider는 하위 Widget들의 공통되는 Parent Widget tree의 상위에 정의 한다.
 3. 변경되는 값들이 하위 Widget들에 자동 반여되기 위해서는 ChangeNotifier, notifyListeners(), listener등록 등이 되어야 가능하다.

### 1-3 Provider 속성설명
 1. Provider<T>
    - <T> 사용되는 type을 정의한다. 필수는 아니다.
    - 선언을 해놓으면 하위에서 사용도중 casting을 안해도 되기 때문에 유용하다.
 2. Key? key
    - 
 3. required Create<T> create
    - 
 4. Dispose<T>? dispose
    - 
 5. bool? lazy
    - default 값은 lazy=true이다.
    - 선언문장을 만났을 경우 Provider를 create구문 수행여부는 lazy 속성에 의해 결정 된다.
    - lazy=true; 이면, 선언시 create하지 않고 하위Widget class에서 해당 Provider type을 사용한다는 문장을 만나는 시점에 create를 하게 된다.
    - lazy=false; 이면, 선언과 동시에 create를 한다.
 6. TransitionBuilder? builder
    - 
 7. Widget? child
    - 하위 Widget class를 기술한다.

### 1-4 Provider 하위Widget(class)에서 사용문법 및 정의
 1. listen: false   
    - 사용문법] Provider.of<Dog>(context).name
    - Provider type으로 정의된 instance에 대한 값을 보여준다.
    - instance의 값이 변경되어도 재 반영(적용)되지는 않는다.

    - 예외, StatfullWidget이면서 setState()문장을 수행하면 변경된 값이 반영된다.    

 2. listen: true   
    - 사용문법] Provider.of<Dog>(context, listen: true).age
    - Provider listener로 등록 시켜준다.
    - Provider type으로 정의된 instance에 대한 값을 보여준다.
    - instance의 값이 변경되면 재 반영(적용)되어 보여준다.
    - 단, Provider type의 class가 ChangeNotifier를 상속받고, notifyListeners()를 호출해줘야 된다.

### 1-5 Provider Widget생성과정 및 진행 프로세스
 1. 진행 프로세스
    - Provider 정의시 생성(lazy:true)
    - 하위 Widget class에서 사용
    - Provider type으로 정의된 instance가 변경 시 notify를 해준다.
    - Listener의 class들은 rebuild 한다.
    - 참고, `Provider 정의시 생성 프로세스쪽으로 다시 호출 되지 않는다.`
   

# 2. ChangeNotifier
### 2-1 ChangeNotifier Syntax
### 2-2 ChangeNotifier 정의
### 2-3 ChangeNotifier 속성설명
### 2-4 ChangeNotifier 하위Widget(class)에서 사용문법 및 정의

### 2-5 Provider Widget생성과정 및 진행 프로세스

# 3. ChangeNotifierProvider
### 3-1 ChangeNotifierProvider Syntax
### 3-2 ChangeNotifierProvider 정의
### 3-3 ChangeNotifierProvider 속성설명
### 3-4 ChangeNotifierProvider 하위Widget(class)에서 사용문법 및 정의

### 3-5 ChangeNotifierProvider Widget생성과정 및 진행 프로세스

# 4. FutureProvider
### 4-1 FutureProvider Syntax
### 4-2 FutureProvider 정의
 1. FutureProvider는 두번 build된다.
    - 첫번째는 initialData를 기준으로 build된다.
    - 두번째는 create 쪽에서 Future값이 return된 후에 build된다.
 2. FutureProvider는 Future return value를 type으로 선언한다.    
### 4-3 FutureProvider 속성설명
### 4-3 FutureProvider 하위Widget(class)에서 사용문법 및 정의

### 4-5 FutureProvider Widget생성과정 및 진행 프로세스


# 5. StreamProvider
### 6-1 StreamProvider Syntax
### 6-2 StreamProvider 정의
 1. StreamProvider는 여러번 build된다.
    - 첫번째는 initialData를 기준으로 build된다.
    - 두번째는 create 쪽에서 Stream값이 return될때 마다 build된다.
 2. StreamProvider는 Stream return value를 type으로 선언한다.    
### 6-3 StreamProvider 속성설명
### 6-3 StreamProvider 하위Widget(class)에서 사용문법 및 정의

# ?. ????
### ?-1 ???? Syntax
### ?-2 ???? 정의
### ?-3 ???? 속성설명
### ?-3 ???? 하위Widget(class)에서 사용문법 및 정의
