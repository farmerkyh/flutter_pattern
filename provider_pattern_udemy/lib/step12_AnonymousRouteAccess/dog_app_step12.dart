import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'show_me_counter.dart';

void main() {
  runApp(const AnonymousRouteAccessStep12());
}

class AnonymousRouteAccessStep12 extends StatelessWidget {
  const AnonymousRouteAccessStep12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anonymous Route',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: const MyHomePage(),
      ),
    );
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
              child: const Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  //builder: (context) 로 작성하면 버튼 클릭 시 오류가 발생한다.
                  // ShowMeCounter() class에서 context를 사용할 때
                  // router에 있는 builder: (context) 가 아니기 때문이다.
                  // 그래서 사용하지 않겠다고 _ 로 처리 한다.
                  // _ 대신 counterContext로 해도 된다.
                  //MaterialPageRoute(builder: (context) {
                  MaterialPageRoute(builder: (_) {
                    return ChangeNotifierProvider.value(
                      value: context.read<Counter>(),
                      child: const ShowMeCounter(),
                    );
                  }),
                );
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
