import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const ProviderExtensionStep5());
}

class ProviderExtensionStep5 extends StatelessWidget {
  const ProviderExtensionStep5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog05', breed: 'breed05', age: 3),
      child: MaterialApp(
        title: 'Provider 05',
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
          //mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            NameFirst(),
            SizedBox(height: 30.0),
            NameSecond(),
            SizedBox(height: 30.0),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class NameFirst extends StatelessWidget {
  const NameFirst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('NameFirst');
    return Container(
      //alignment: Alignment,
      color: Colors.amber[100],
      child: Column(
        children: [
          const Text('[ NameFirst class ]', style: TextStyle(fontSize: 20.0)),
          Text(
            '1. name (read): ${context.read<Dog>().name}',
            style: const TextStyle(fontSize: 20.0),
          ),
          Text(
            '2. age (watch): ${context.watch<Dog>().age}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const NameSecond(),
        ],
      ),
    );
  }
}

class NameSecond extends StatelessWidget {
  const NameSecond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('NameSecond');
    return Container(
      color: Colors.blue[100],
      child: Column(
        children: [
          const Text('   [ NameSecond class ]   ',
              style: TextStyle(fontSize: 20.0)),
          Text(
            '3. age (read): ${context.read<Dog>().age}',
            style: const TextStyle(fontSize: 20.0),
          ),
        ],
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
      color: Colors.red[100],
      child: Column(
        children: [
          const Text('   [ BreedAndAge class ]   ',
              style: TextStyle(fontSize: 20.0)),
          Text(
            '4. breed (select): ${context.select<Dog, String>((Dog dog) => dog.breed)}',
            style: const TextStyle(fontSize: 20.0),
          ),
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
      color: Colors.yellow[100],
      child: Column(
        children: [
          const Text('   [ Age class ]   ', style: TextStyle(fontSize: 20.0)),
          Text(
            '5.. age (select): ${context.select<Dog, int>((Dog dog) => dog.age)}',
            style: const TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => context.read<Dog>().grow(),
            child: const Text('Grow', style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}
