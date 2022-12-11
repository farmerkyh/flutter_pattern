import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() {
  runApp(const ProviderNotFoundExceptionStep11());
}

class ProviderNotFoundExceptionStep11 extends StatelessWidget {
  const ProviderNotFoundExceptionStep11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 11',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<Counter>(
          create: (_) => Counter(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${context.watch<Counter>().counter}',
                    style: const TextStyle(fontSize: 48.0),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: const Text('Increment',
                        style: TextStyle(fontSize: 20.0)),
                    onPressed: () {
                      context.read<Counter>().increment();
                    },
                  )
                ],
              );
            },
          ),
        ),
        //아래와 같이 builder 속성을 사용하지 않으면 오류가 발생한다.
        // child: ChangeNotifierProvider<Counter>(
        //   create: (context) => Counter(),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         '${context.watch<Counter>().counter}',
        //         style: const TextStyle(fontSize: 48.0),
        //       ),
        //       const SizedBox(height: 20.0),
        //       ElevatedButton(
        //         child:
        //             const Text('Increment', style: TextStyle(fontSize: 20.0)),
        //         onPressed: () {
        //           context.read<Counter>().increment();
        //         },
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
