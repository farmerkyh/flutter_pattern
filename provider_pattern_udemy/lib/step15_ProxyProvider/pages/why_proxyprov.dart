import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Model
class Translations {
  final int _value;
  const Translations(this._value);

  String get title => 'You clicked $_value times';
}

class WhyProxyProv extends StatefulWidget {
  const WhyProxyProv({Key? key}) : super(key: key);

  @override
  _WhyProxyProvState createState() => _WhyProxyProvState();
}

class _WhyProxyProvState extends State<WhyProxyProv> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
      print('counter: $counter');
    });
  }

  @override
  Widget build(BuildContext context) {
    //[INCREASE] 버튼을 클릭 하면 build는 계속 수행 된다.
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Why ProxyProvider'),
      ),
      body: Center(
        child: Provider<Translations>(
          //[INCREASE] 버튼을 클릭 하면 build는 계속 수행 되지만 create 속성은 한번만 호출 된다.
          create: (_) => Translations(counter),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShowTranslations(),
              const SizedBox(height: 20.0),
              IncreaseButton(increment: increment),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowTranslations extends StatelessWidget {
  const ShowTranslations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Provider.of<Translations>(context).title;

    return Text(title, style: const TextStyle(fontSize: 28.0));
  }
}

class IncreaseButton extends StatelessWidget {
  final VoidCallback increment;
  const IncreaseButton({
    Key? key,
    required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: const Text('INCREASE', style: TextStyle(fontSize: 20.0)),
    );
  }
}
