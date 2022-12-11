import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'show_me_counter.dart';

void main() {
  runApp(GeneratedRouteAccessStep14());
}

class GeneratedRouteAccessStep14 extends StatefulWidget {
  GeneratedRouteAccessStep14({Key? key}) : super(key: key);

  @override
  State<GeneratedRouteAccessStep14> createState() =>
      _GeneratedRouteAccessStep14State();
}

class _GeneratedRouteAccessStep14State
    extends State<GeneratedRouteAccessStep14> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated Access Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const MyHomePage(),
              ),
            );
          case '/counter':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: const ShowMeCounter(),
              ),
            );
          default:
            return null;
        }
      },
    );
  }

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
