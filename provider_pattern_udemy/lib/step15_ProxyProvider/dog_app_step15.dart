import 'package:flutter/material.dart';

import 'pages/chgnotiprov_chgnotiproxyprov.dart';
import 'pages/chgnotiprov_proxyprov.dart';
import 'pages/proxyprov_create_update.dart';
import 'pages/proxyprov_proxyprov.dart';
import 'pages/proxyprov_update.dart';
import 'pages/why_proxyprov.dart';

void main() {
  runApp(const ProxyProviderStep15());
}

class ProxyProviderStep15 extends StatelessWidget {
  const ProxyProviderStep15({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(
                child: const Text(
                  '1. Why\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WhyProxyProv(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text(
                  '2. ProxyProvider\nupdate',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProxyProvUpdate(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text(
                  '3. ProxyProvider\ncreate/update',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ProxyProvCreateUpdate()),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('4. ProxyProvider\nProxyProvider',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProxyProvProxyProv()),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text(
                  '5. ChangeNotifierProvider\nChangeNotifierProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ChgNotiProvChgNotiProxyProv()),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text(
                  '6. ChangeNotifierProvider\nProxyProvider',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ChgNotiProvProxyProv()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
