import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/babies.dart';
import 'models/dog.dart';

void main() {
  runApp(const StreamProviderStep7());
}

class StreamProviderStep7 extends StatelessWidget {
  const StreamProviderStep7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: 'dog07', breed: 'breed07', age: 3),
        ),
        FutureProvider<int>(
          initialData: 0,
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
        ),
        StreamProvider<String>(
          initialData: 'Bark 0 times',
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            //watch
            //  - create속성은 한번만 수행 된다. 그래서 논리적으로 watch를 사용할 수 없다. (error발생)
            //final int dogAge = context.watch<Dog>().age;
            final babies = Babies(age: dogAge * 2);
            return babies.bark();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider 07',
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
        title: const Text('Provider 07'),
      ),
      body: Center(
        child: Container(
          color: Colors.amber[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('                [ MyHomePage class ]                ',
                  style: TextStyle(fontSize: 20.0)),
              Text('1. name: ${context.watch<Dog>().name}',
                  style: const TextStyle(fontSize: 20.0)),
              const SizedBox(height: 10.0),
              const BreedAndAge(),
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
          const Text('           [ BreedAndAge class ]           ',
              style: TextStyle(fontSize: 20.0)),
          Text(
              '2. breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
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
    return Container(
      color: Colors.red[100],
      child: Column(
        children: [
          const Text('           [ Age class ]           ',
              style: TextStyle(fontSize: 20.0)),
          Text(
              '3. age (select): ${context.select<Dog, int>((Dog dog) => dog.age)}',
              style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 10.0),
          Text('4. number of babies (read): ${context.read<int>()}',
              style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 10.0),
          Text('5. (watch) ${context.watch<String>()}',
              style: const TextStyle(fontSize: 20.0)),
          Text('6. (read) ${context.read<String>()}',
              style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => context.read<Dog>().grow(),
            child: const Text('Grow버튼', style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}
