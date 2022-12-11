import 'package:flutter/material.dart';

import '../step3_changeNotifier/models/dog.dart';

void main() {
  runApp(const ChangeNotifierProviderStep3());
}

class ChangeNotifierProviderStep3 extends StatelessWidget {
  const ChangeNotifierProviderStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 03',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dog = Dog(name: 'dog03', breed: 'breed03');

  @override
  void initState() {
    super.initState();
    //addListener()
    // - addListener()에 추가시킨 method는  dog instance에서 notifyListeners() method가 호출 되면
    //   listen하고 있는 method들을 호출시켜 준다.
    dog.addListener(dogListener);
  }

  void dogListener() {
    print('age listner: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('- name: ${dog.name}', style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 10.0),
            BreedAndAge(dog: dog),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('- breed: ${dog.breed}', style: const TextStyle(fontSize: 20.0)),
        const SizedBox(height: 10.0),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${dog.age}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => dog.grow(),
          child: const Text('Grow', style: TextStyle(fontSize: 20.0)),
        ),
      ],
    );
  }
}
