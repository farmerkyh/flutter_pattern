import 'package:flutter/material.dart';

void main() {
  runApp(const CounterAppStep1());
}

class CounterAppStep1 extends StatelessWidget {
  const CounterAppStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
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
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(20.0),
              child: const Text('MyHomePage', style: TextStyle(fontSize: 24.0)),
            ),
            const SizedBox(height: 20.0),
            CounterA(
              counter: counter,
              increment: increment, //method를 넘기는 기법을 Inversion of control
            ),
            const SizedBox(height: 20.0),
            Middle(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;

  const CounterA({
    Key? key,
    required this.counter,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text('[CounterA class]'),
          Text('$counter', style: const TextStyle(fontSize: 48.0)),
          ElevatedButton(
            onPressed: increment,
            child: const Text('Increment 버튼', style: TextStyle(fontSize: 20.0)),
          ),
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;
  const Middle({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('[Middle class]'),
          CounterB(counter: counter),
          const SizedBox(height: 20.0),
          const Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;
  const CounterB({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10.0),
      child: Text('$counter', style: const TextStyle(fontSize: 24.0)),
    );
  }
}

//아무것도 넘겨받은 않는 widget도 있다라는 뜻에서 Sibling class가 존재
class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: const [
          Text('[Sibling class]'),
          Text('Sibling', style: TextStyle(fontSize: 24.0)),
        ],
      ),
    );
  }
}
