import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/babies.dart';
import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: 'dog06', breed: 'breed06', age: 1),
        ),

        //FutureProvider<int>
        //  - FutureProvider의 Type은 Future의 return value의 type이 된다.
        //context.read<Dog>().age
        //  - 이곳에 Dog instance의 age를 사용할 수 있다.
        //  - 사용가능 이유는
        //    비록 ChangeNotifierProvider()와 FutureProvider()와 같은 레벨사용하기는 했지만
        //    ChangeNotifierProvider()가 FutureProvider()의 상위(?) Widget으로 Widget tree에서 구성되기 때문이다.
        //    즉, 하위 FutureProvider() Widget은 상위 Widget의 Provider를 사용할 수 있기 때문이다.
        //  - 강사는 ChangeNotifierProvider()가 FutureProvider()의 상위(?) Widget 이라고 했는데, 정말(?)일까? 동급레벨이라 access가능한거 아닌가? ㅋㅋ
        FutureProvider<int>(
          initialData: 3,
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            //watch
            //  - FutureProvider정의시 watch를 사용학고, lazy=false를 하면 error발생한다.
            //  - FutureProvider는 초기에 한번만 수행 되기 때문이다.
            //  - watch의 특징은 listener가 되어 변경시 반영된 값을 받으려는 성격이 있기 때문이다.
            //final int dogAge = context.watch<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
          lazy: false, //default=true
        ),
      ],
      child: MaterialApp(
        title: 'Provider 06',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 05'),
      ),
      body: Center(
        child: Container(
          color: Colors.amber[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('              [ MyHomePage class ]                 ', style: TextStyle(fontSize: 20.0)),
              Text('1. name: ${context.watch<Dog>().name}', style: const TextStyle(fontSize: 20.0)),
              const SizedBox(height: 30.0),
              const BreedAndAge(),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Column(
        children: [
          const Text('            [ BreedAndAge class ]            ', style: TextStyle(fontSize: 20.0)),
          Text('2. breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
              style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 10.0),
          const Age(),
        ],
      ),
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('-----------');
    debugPrint('Age build---');
    return Container(
      color: Colors.red[100],
      child: Column(
        children: [
          const Text('[ Age class ]', style: TextStyle(fontSize: 20.0)),
          Text('3. age (select): ${context.select<Dog, int>((Dog dog) => dog.age)}',
              style: const TextStyle(fontSize: 20.0)),
          //Consumer는 다다..음(?) 챕터에서 진행예정
          // Consumer<Dog>(builder: (context, Dog dog, _) {
          //   return Text(
          //     '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
          //     style: const TextStyle(fontSize: 20.0),
          //   );
          // }),
          const SizedBox(height: 10.0),
          Text('4. number of babies (watch) : ${context.watch<int>()}', style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 10.0),
          Text('5. number of babies (read) : ${context.read<int>()}', style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () => context.read<Dog>().grow(),
              child: const Text('Grow버튼', style: TextStyle(fontSize: 20.0))),
        ],
      ),
    );
  }
}
