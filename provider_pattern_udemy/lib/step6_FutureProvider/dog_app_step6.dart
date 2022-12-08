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
        //    ChangeNotifierProvider()가 FutureProvider()의 상위 Widget으로 Widget tree에서 구성되기 때문이다.
        //    즉, 하위 FutureProvider() Widget은 상위 Widget의 Provider를 사용할 수 있기 때문이다.
        FutureProvider<int>(
          initialData: 1,
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            //final int dogAge = context.watch<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider 06',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${context.watch<Dog>().name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            const BreedAndAge(),
          ],
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
    return Column(
      children: [
        Text(
          '- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        const Age(),
      ],
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
    return Column(
      children: [
        Text(
          '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        // Consumer<Dog>(builder: (context, Dog dog, _) {
        //   return Text(
        //     '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
        //     style: const TextStyle(fontSize: 20.0),
        //   );
        // }),
        // const SizedBox(height: 10.0),
        // Text(
        //   '- number of babies - watch : ${context.watch<int>()}',
        //   style: const TextStyle(fontSize: 20.0),
        // ),
        // const SizedBox(height: 10.0),
        // Text(
        //   '- number of babies - read : ${context.read<int>()}',
        //   style: const TextStyle(fontSize: 20.0),
        // ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => context.read<Dog>().grow(),
          child: const Text('Grow', style: TextStyle(fontSize: 20.0)),
        ),
      ],
    );
  }
}
