import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fish_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Provider pattern
    //1. MaterialApp을 Provider widget의 child로 감싼다.
    //   - 이로써 MaterialApp하위 모든 위젯에서 FishModel instance에 접근을 할 수 있게 된다.
    //   - 즉, 자료를 넘겨줄 수로가 생기는 것이다.
    //2. (constext) 를
    //3. create: 를 통해서 FishModel클래스를 리턴해 주게 된다.
    return Provider(
      //create: (BuildContext context) {  },
      create: (context) => FishModel(name: 'Salmon', number: 10, size: 'big'),
      child: MaterialApp(
        home: FishOrder(),
      ),
    );
  }
}

//주문이 들어온 생성 이름을 출력하는 class
class FishOrder extends StatelessWidget {
  const FishOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fish Order')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Fish name: ${Provider.of<FishModel>(context).name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            High()
          ],
        ),
      ),
    );
  }
}

//위치를 출력과 SpicyA 라는 매운탕 집 위젯을 불러오낟.
class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SpicyA is locate at high place',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        SpciyA()
      ],
    );
  }
}

//2개의 text widget과 middle 위젯으로 구성
class SpciyA extends StatelessWidget {
  const SpciyA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Fish number: ${Provider.of<FishModel>(context).number}', //주문한 생선 수량
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
        Text(
          'Fish size: ${Provider.of<FishModel>(context).size}', //주문한 생선의 size
          style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Middle()
      ],
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'number: ${Provider.of<FishModel>(context).number}', //주문한 생선 수량
          style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Text(
          'size: ${Provider.of<FishModel>(context).size}', //주문한 생선의 size
          style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Low()
      ],
    );
  }
}

class Low extends StatelessWidget {
  const Low({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SpicyC is located a low place',
          style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SpicyC()
      ],
    );
  }
}

class SpicyC extends StatelessWidget {
  const SpicyC({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'number: ${Provider.of<FishModel>(context).number}', //주문한 생선 수량
          style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Text(
          'size: ${Provider.of<FishModel>(context).size}', //주문한 생선의 size
          style: TextStyle(
              fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
