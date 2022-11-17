# Provider Pattern

## 1. Provider 패턴이란?? 
 -  Provider는 플러터 커뮤니티에서 만든 플러그인이었으나 현재는 구글에서 추천할 정도로 편리하다. 
 - 원래 구글은 Provider가 아닌 Bloc 패턴 사용을 권장했었다고 한다. 
 - 이유는 플러터는 UI와 Design 모두 소스코드로 관리되지 않으면 한 클래스에 여러 코드가 몰리는 문제점이 있다. 
 - 그래서 이를 해결하기 위해 UI와 데이터 처리 로직을 분리하기 위해 Bloc 패턴을 제공하게 됐다. 
 - 하지만 Bloc패턴은 사용하기 어렵다는 단점이 있었고 단순한 로직을 구성하려해도 최소 4개의 클래스를 만들어야 했다. 

## 2. Provider가 좋은 이유
 - 모든 상태관리가 그렇듯이 데이터를 한 페이지 내에서만 사용한다면 상태 관리가 어렵지 않다. 
 - 하지만 앱의 규모가 커지면 코드는 복잡해지고 효과적인 상태 관리가 필요하다는 것을 느끼게 된다. 

### 1. 관심사의 분리 (separation of concerns)
 > 관심사의 분리는 디자인 원칙의 하나입니다.
 > 보통 관심사는 어떤 코드가 하는 일을 말합니다.
 > UI를 담당하는 코드, 네트워크를 담당하는 코드, 데이터를 담당하는 코드 등 코드를 역할에 따라 나눌 수 있죠.
 >
 > 보통은 한 클래스가 여러 역할을 할 수록, 클래스가 커지고 관리가 어렵게 됩니다.
 > 따라서 클래스가 하나의 역할(관심)만 갖도록, 클래스를 나누죠.
 >
 > 이게 바로 관심사의 분리입니다.
 >
 > Provider나 Bloc 패턴을 쓰는 이유는 관심사의 분리를 위해서에요.

### 2. 데이터의 공유 
 > 하나의 데이터를 여러 페이지에서 공유하고 싶을 때가 있습니다. 유저 인증 정보의 경우 장바구니, 회원 등급 등 여러 페이지에서 쓰이죠. 
 > 근데 페이지마다 인증 정보를 새로 불러온다면 앱이 복잡해지고, 비용도 많이 들겠죠?
 > 
 > 이럴 때 데이터 공유가 필요합니다.
 > Provider 패턴을 쓰면 데이터 공유를 쉽게 할 수 있습니다.
 
### 3. 간결한 코드 
 > Bloc 패턴의 경우 클래스들을 역할 별로 나누는 데는 좋지만 코드 자체가 복잡해지는 경향이 있습니다.
 > Provider 패턴을 쓰면 좀 더 적은 코드로 클래스들을 구분해서 쓸 수 있죠.
 > 구글에서도 중규모 프로젝트는 Provider 패턴을, 대규모 프로젝트는 Bloc 패턴을 추천하고 있습니다.

## 3. Provider 구조

### 1. 데이터 생산과 소비
 - Provider는 데이터를 생산하고, 소비하는 2부분으로 되어 있습니다.
 - 어떤 데이터를 생산하느냐에 따라 Provider의 종류가 달라지죠.
 - 그냥 Provider가 되기도 하고 StreamProvider가 되기도 하고 합니다.
 
#### 1.1 Provider 데이터 생산하기
 - 데이터를 생산할 때는 꼭 데이터 타입을 적어줍니다.
 - 여기선 int 형태로 데이터를 만들었죠.
```dart
	Provider<int>.value( // int 타입 사용
		  value: 5,
		  child: Container(),
	)
```

#### 1.2 Provider 데이터 소비하기
 - Provider에서 만든(제공하는) 데이터를 쓰려면 Provider.of(context) 나 Consumer() 위젯을 사용합니다.
 - 저는 Provider.of(context) 가 더 쓰기 편해 이쪽을 더 선호합니다.
 
```dart
	var data = Provider.of<int>(context) // int 타입 사용. Provider를 만들 때 int 타입을 썼기에..
```

## 3. Provider 예문
### 1. 기본 Provider 사용해보기 : 데이터 생산
```dart
void main() {
  runApp(SimpleApp());
}
​
class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<int>.value( // Provider로 위젯을 감싸면, 자식 위젯에서 그 값을 사용 가능.
      value: 5, // Provider에서 제공하는 값은 5
      child: MaterialApp(
        home: SimplePage(),
      ),
    );
  }
}
```

 > Provider를 쓰려면 부모 위젯을 Provider로 감싸줘야합니다.
 > 전체 앱에서 사용하고 싶으면 MateriapApp을 감싸면 됩니다.
 > Provider에서 어떤 값을 쓸지를 정해야 하는데요.
 > 전 5를 주었습니다. 지금은 value가 5로 고정되어 있지만, 변하는 값을 넣는 것도 얼마든지 가능합니다.

### 2. 기본 Provider 사용해보기 :  데이터 소비
```dart
class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<int>(context); // 가까운 Provider로부터 값을 가져옵니다. 
​
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple app'),
      ),
      body: Center(
        child: Text('${data}'), // 값이 표시됩니다 (여기서는 5)
      ),
    );
  }
}
``` 

 > Provider.of(context) 함수를 통해 데이터를 가져옵니다.
 > 이 값은 5 입니다. 부모 위젯에서 정한 값이죠. 
 > 데이터를 만드는 곳과 쓰는 곳이 분리되어 있습니다.
 > 이게 Provider 패턴의 가장 큰 특징이죠.
 > 사실상 옵저버 패턴과 큰 차이가 없어요.

 - 그럼 Provider를 써서 값이 변할 때 어떻게 하는지를 알아보겠습니다.

## 4. ChangeNotifierProvider 사용하기 - 변하는 값 처리하기
 > UI에 있는 값이 변했을 때, UI를 변경해 줘야합니다.
 > 이를 setState() 로 할 수도 있겠지만 ChangeNotifier 를 쓰면 같은 일을 할 수 있습니다.
 > 
 > ChangeNotifier를 믹스인 (mixin) 한 클래스는 notifyListeners() 함수를 부를 수 있습니다.
 > 이 함수를 쓰면 UI가 업데이트 됩니다.

### 1. counter 값이 변할때, UI를 업데이트 하도록 만든 클래스입니다.
```dart
import 'package:flutter/material.dart';
​
class Counter with ChangeNotifier {
  int _counter;
​
  Counter(this._counter);
​
  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;
​
  void increment() {
    _counter++;
    notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
  }
​
  void decrement() {
    _counter--;
    notifyListeners(); // 값이 변할 때마다 플러터 프레임워크에 알려줍니다.
  }
}
```
 > Counter 클래스를 Provider에 넣어볼텐데요.
 > Counter 클래스가 ChangeNotifier를 믹스인 했기에
 > ChangeNotifierProvider 를 사용해줘야합니다.

### 2. CounterApp
 - ChangeNotifierProvider 로 위젯을 감싸줍니다 - 데이터 사용할 준비하기
```dart
class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>( // Counter 타입 사용. Counter 클래스의 데이터가 변하는지 보고 있다가 변하면 알려줍니다.
      builder: (_) => Counter(0), // 초기값 정하기
      child: MaterialApp(
        title: 'Flutter Value',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
```
 > 머터리얼 앱을 ChangeNotifierProvider로 감싸고 있습니다.
 > builder 속성에서 초기값을 정하고 이를
 > 자식 위젯들에서 사용합니다.

### 3. ChangeNotifierProvider의 값 사용하기
 > 예제 2.2에서 제공하는 데이터를 위젯에서 보여줍니다.
 > +,- 버튼을 누를 때마다 값이 바뀌죠.
```dart
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
​
  @override
  _HomePageState createState() => _HomePageState();
}
​
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context); // Counter 타입의 데이터를 가져옴. 
​
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: openFirstPage,
              child: Text('first page'),
            ),
            RaisedButton(
              onPressed: openSecondPage,
              child: Text('second page'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counter.increment, // 버튼을 누를 때마다, 값이 증가합니다. notifyListeners()가 호출되기에 UI가 갱신됩니다.
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: null,
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: counter.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            heroTag: null,
          )
        ],
      ),
    );
  }
​
  // 다른 페이지로 이동을 합니다. 이동한 페이지에서도 Counter의 값은 동일합니다.
  Future openFirstPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstPage()),
    );
  }
​
  Future openSecondPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
  }
}
```

 > 아래 그림 같은 UI 인데요.
 > +, - 버튼을 누르면 중앙에 있는 값이 바뀝니다.

 - 그럼 다른 페이지에서도 Counter 값이 잘 공유되는지 알아볼께요.

### 4. FirstPage 다른 페이지에서도 값이 동일한지 확인
```dart
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
​
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
​
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        child: Container(
          child: Text('first page counter ${counter.getCounter()}'),
        ),
      ),
    );
  }
}
```
 > 다른 페이지에서도 값이 동일합니다.
 > 똑같이 5가 나오는 걸 알 수 있죠.
 > 
 > 생각보다 프로바이더 쓰는 건 간단합니다!!
 > 다만 문제가 하나 있는데요.
 > 
 > Provider가 여러개 일수록 관리가 어려워진다는 거죠.
 > 게다가 Provider 가 중첩될 경우엔 앱이 난잡해지기 쉽습니다.
 > 
 > 이때 쓰는 게 MultiProvider 에요.

## 5. MultiProvider - 여러 프로바이더 같이 사용하기
 > 멀티 프로바이더를 쓰면 프로바이더 관리가 상당히 편해집니다.
 > 다른 위젯들이랑 섞일 일이 없어서 쓰기 편해지죠.
 > 사용법은 간단합니다.
 > 
 > MultiProvider의 providers 속성에 원하는 프로바이더를 적어주면 됩니다.
 > 여러개 적을 수 있죠.

 - MultiProvider 사용 예
```dart
Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<int>.value(value: 50),
        Provider<String>.value(value: "Hello World"),
      ],
    );
 }
 ```
 > 프로바이더는 자료형으로 어떤 값을 가져올지 구분합니다.
 > 근데 멀티 프로바이더에 같은 자료형이 여러번 정의 된다면 어떻게 될까요?
 
 - MultiProvider - 같은 자료형이 여러개면 가장 밑에 있는 것에 접근.
```dart
MultiProvider(
      providers: [
        Provider<int>.value(value: 50),
        Provider<int>.value(value: 100),
        Provider<int>.value(value: 300), // Provider.of<int> 로 접근하면 이 값만 가져옴. 
      ]
)
```

 > 같은 자료형인 프로바이더가 여러개일 경우, 가장 밑에 값으로 처리합니다.
 > 그럼 좀 더 실용적인 예제를 만들어보겠습니다.
 > 파이어 스토어의 데이터를 받아서 보여주는 예제에요.
 > 화면 2개로 구성되어 있는데 1개는 로그인 화면, 1개는 유저 데이터를 보여주는 화면입니다.

 - 예제3. 로그인 화면 - 로그인 안 되었을 때 나옴
 - 예제3. 유저 데이터 화면 - 로그인 되면 나옴

 - 우선 라이브러리부터 추가하겠습니다.
 - 예제 3.1 pubspec.yaml
```dart
 cloud_firestore: ^0.12.9
 firebase_auth: ^0.14.0
```

이제 파이어 스토어에서 필요한 데이터를 만들어주세요.

데이터는 아래 그림과 같은 형식입니다.

User 콜렉션과 다큐먼트를 만들어 주세요~!

 

예제 3.2 파이어스토어에 데이터 추가하기
flutter_firestore

 

파이어 스토어의 데이터를 앱에서 읽으려면

그에 걸맞은 클래스가 필요하겠죠?

user.dart 에서 이 일을 합니다.

 

예제 3.3 user.dart - 데이터를 담을 클래스
```dart
import 'package:cloud_firestore/cloud_firestore.dart';
​
class User {
  final String name;
  final int age;
​
  User({this.name, this.age});
​
  factory User.fromMap(Map map) {
    return User(
      name: map['name'] ?? '', // 디폴트 값은 '' 으로 했습니다.
      age: map['age'] ?? 0,
    );
  }
​
  factory User.fromFireStore(DocumentSnapshot doc) {
    Map map = doc.data;
​
    return User(
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
    ) ;
  }
}
``` 

 

데이터 관리는 따로 클래스를 만들어서 하겠습니다.

Database Provider 라는 클래스인데요.

파이어 스토어로부터 데이터를 읽어 들입니다.

 

예제 3.4 database_provider.dart - 파이어 스토어를 관리할 클래스
```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_state_provider/model/user.dart';
​
class DatabaseProvider {
  final Firestore _db = Firestore.instance;
​
  // User 1명의 데이터 읽기
  Future<User> getUser(String id) async {
    var snap = await _db.collection('user').document(id).get();
​
    return User.fromMap(snap.data);
  }
​
  // User 여러명의 데이터 읽기
  Stream<List<User>> getUsers() {
    // DocumentSnapshot 으로 되어 있기에 이를 리스트 형식으로 바꿔줌.
    return _db.collection('user').snapshots().map((list) =>
        list.documents.map((doc) => User.fromFireStore(doc)).toList());
  }
}
​```
 

이제 프로바이더를 써서 데이터를 읽어들이도록 할께요.

DatabaseProvider 클래스에서 만든 함수 2개를 사용합니다.

 

 

예제 3.5 login_app.dart - 로그인 화면을 처리하고, 유저 데이터를 보여줄 클래스
```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
​
import 'database/database_provider.dart';
import 'model/user.dart';
​
class LoginApp extends StatelessWidget {
  DatabaseProvider db = DatabaseProvider();
​
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 스트림 프로바이더로 인증 정보를 읽어들임. 인증 상태가 변하면, 변한 값이 출력됨.
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        // 스트림 프로바이더로 파이어스토어 데이터를 읽어들임.
        StreamProvider<List<User>>.value(
          value: db.getUsers(),
        ),
      ],
      child: MaterialApp(
        title: '인증 프로바이더',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
​
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
​
class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  Map data = Map();
​
  FirebaseAuth auth = FirebaseAuth.instance;
​
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    var loggedIn = user != null;
​
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "로긴 페이지",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          // 로그인(가입)된 유저일 경우만 UI에서 보여줌.
          if (loggedIn) ...[
            RaisedButton(child: Text("Sign out"), onPressed: auth.signOut),
            UserList(), // User 데이터를 보여주는 위젯
          ],
          // 로그인이 안 된 유저일 경우 보여주는 UI - 가입 화면
          if (!loggedIn) ...[
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(
                  icon: Icon(Icons.email), hintText: '이메일을 적어주세요.'),
            ),
            TextFormField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                  icon: Icon(Icons.keyboard), hintText: '비밀번호를 적어주세요.'),
              obscureText: true,
            ),
            RaisedButton(
              child: Text("Sign up"),
              onPressed: signUp,
            )
          ]
        ],
      ),
    );
  }
​
  void signUp() {
    String email = emailCtrl.text;
    String password = passwordCtrl.text;
    auth.createUserWithEmailAndPassword(email: email, password: password);
​
    emailCtrl.clear();
    passwordCtrl.clear();
  }
}
​```
 

로그인이 되었으면 유저 데이터를 보여주고,

로그인이 안 되었으면 email, password 입력 화면이 나옵니다~!

Provider(프로바이더)를 쓰면 이런 상태 관리를 정말 쉽게 할 수 있죠.

 

전 편의상 유저 데이터를 보여주는 위젯은 따로 클래스로 뺐습니다.

이 부분까지만 하면 이 예제는 끝이에요.

 

예제 3.6 user_list.dart - 유저 데이터를 보여줄 위젯
​```dart
class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}
​
class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    var users = Provider.of<List<User>>(context);
​
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return ListTile(
            title: Text("이름 -  ${user.name}"),
            leading: Text("나이 - ${user.age}"),
          );
        },
      ),
    );
  }
}
``` 

 

 

 

이제까지 Provider 에 대해서 알아보았습니다.

Bloc 패턴에 비하면 정말 간결합니다.

Provider 패턴을 쓰면 좀 더 부담없이 깔끔한 코드를 작성할 수 있단 생각이 드네요!

 

이 글에 쓰인 소스는 여기 에서 찾아보실 수 있습니다.

 

예제 1,2,3은 주석 처리를 지우면서 실행해 보세요!

void main() {
  runApp(SimpleApp()); 
​
  //runApp(CounterApp());
  //runApp(LoginApp());
}
 

이번 글에선 프로바이더에 대해서 알아보았는데요.

다음 글에선 애니메이션이나 파이어베이스에 대해서 알아볼 예정입니다.

 

여기까지 읽어주셔서 감사합니다.


 
- 참조 : https://software-creator.tistory.com/26
