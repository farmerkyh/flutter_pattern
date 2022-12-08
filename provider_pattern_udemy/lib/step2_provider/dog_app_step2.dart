import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Dog>(
      create: (context) => Dog(name: 'Sun', breed: 'Bulldog', age: 3),
      lazy: true, //default:true
      child: MaterialApp(
        title: 'Provider 02',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 02'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('- name: ${Provider.of<Dog>(context).name}', style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 10.0),
            const BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('- breed: ${Provider.of<Dog>(context).breed}', style: const TextStyle(fontSize: 20.0)),
        const SizedBox(height: 10.0),
        const Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${Provider.of<Dog>(context, listen: true).age}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => Provider.of<Dog>(context, listen: false).grow(),
          child: const Text('Grow', style: TextStyle(fontSize: 20.0)),
        ),
      ],
    );
  }
}
