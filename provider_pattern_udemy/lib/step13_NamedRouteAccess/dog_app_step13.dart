import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'show_me_counter.dart';

void main() {
  runApp(NamedRouteAccessStep13());
}

class NamedRouteAccessStep13 extends StatefulWidget {
  NamedRouteAccessStep13({Key? key}) : super(key: key);

  @override
  State<NamedRouteAccessStep13> createState() => _NamedRouteAccessStep13State();
}

class _NamedRouteAccessStep13State extends State<NamedRouteAccessStep13> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Access Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: const MyHomePage(),
            ),
        '/counter': (context) => ChangeNotifierProvider.value(
              value: _counter,
              child: const ShowMeCounter(),
            ),
      },
    );
  }

  //ChangeNotifierProvider 정의시 create에서 Provider instance를 생성하지만
  //Named route access방식에서는 Provider instance를 Member변수로 생성했다.
  //이럴경우에는 자동으로 dispose되지 않기 때문에 개발자가 직접해줘야 된다.
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Show Me Counter',
                  style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Increment Counter',
                  style: TextStyle(fontSize: 20.0)),
              onPressed: () {
                context.read<Counter>().increment();
              },
            )
          ],
        ),
      ),
    );
  }
}
