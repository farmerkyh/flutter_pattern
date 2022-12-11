import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const ConsumerStep8());
}

class ConsumerStep8 extends StatelessWidget {
  const ConsumerStep8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'dog08', breed: 'breed08', age: 3),
      child: MaterialApp(
        title: 'Provider 08',
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
        title: const Text('Provider 08'),
      ),
      //현재와 같은 소스는 Consumer Widget이 적절하지 않다.
      body: Consumer<Dog>(
        builder: (BuildContext context, Dog dog, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //const Text(..)
                //  Consumer Widget이 rebuild될때 아래 const Text() Widget은 rebuild될 필요가 없다.
                //  그래서 child! 와 같이 기 술 후 Consumer의 child로 이동 시킨다.
                //  이렇게 하면 Conmsumer Widget이 매번 rebuild 되더라도, 아래 child: Text()는 rebuild에 포함되지 않는다.
                //child: const Text('I like dogs very much', style: TextStyle(fontSize: 20.0)),
                child!,
                const SizedBox(height: 10.0),
                //dog.name으로 할 수 있는 이유는
                //  - Consumer > builder (Dog dog)와 같이 arg로 넘어 오기 때문이다.
                Text('- name: ${dog.name}',
                    style: const TextStyle(fontSize: 20.0)),
                const SizedBox(height: 10.0),
                const BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text('I like dogs very much',
            style: TextStyle(fontSize: 20.0)),
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
    return Consumer<Dog>(
      //builder: (_, Dog dog, __)
      //  _  (underscode한개) : Builder Context를 사용하지 않아도 되는 경우
      //  __ (underscode두개) : Child arg를 사용하지 않아도 되는 경우
      builder: (_, Dog dog, __) {
        return Column(
          children: [
            Text('- breed: ${dog.breed}',
                style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 10.0),
            const Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (_, dog, __) {
        return Column(
          children: [
            Text('- age: ${dog.age}', style: const TextStyle(fontSize: 20.0)),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => dog.grow(),
              child: const Text('Grow버튼', style: TextStyle(fontSize: 20.0)),
            ),
          ],
        );
      },
    );
  }
}
