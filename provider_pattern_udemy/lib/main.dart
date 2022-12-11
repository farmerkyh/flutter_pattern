import 'package:flutter/material.dart';
import 'package:provider_pattern_udemy/step10_Selector/dog_app_step10.dart';
import 'package:provider_pattern_udemy/step11_ProviderNotFoundException/dog_app_step11.dart';
import 'package:provider_pattern_udemy/step12_AnonymousRouteAccess/dog_app_step12.dart';
import 'package:provider_pattern_udemy/step13_NamedRouteAccess/dog_app_step13.dart';
import 'package:provider_pattern_udemy/step14_GeneratedRouteAccess/dog_app_step14.dart';
import 'package:provider_pattern_udemy/step15_ProxyProvider/dog_app_step15.dart';
import 'package:provider_pattern_udemy/step1_counter_app/counter_app_step1.dart';
import 'package:provider_pattern_udemy/step2_provider/dog_app_step2.dart';
import 'package:provider_pattern_udemy/step3_ChangeNotifier/dog_app_step3.dart';
import 'package:provider_pattern_udemy/step4_ChangeNotifierProvider/dog_app_step4.dart';
import 'package:provider_pattern_udemy/step5_ProviderExtensionMethod/dog_app_step5.dart';
import 'package:provider_pattern_udemy/step6_FutureProvider/dog_app_step6.dart';
import 'package:provider_pattern_udemy/step7_StreamProvider/dog_app_step7.dart';
import 'package:provider_pattern_udemy/step8_Consumer/dog_app_step8.dart';
import 'package:provider_pattern_udemy/step9_ConsumerException/dog_app_step9.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grid Template',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyGrid(),
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-------------------------------------------------------
      //1. appbar
      //-------------------------------------------------------
      appBar: AppBar(
        title: const Text("Grid/List Template"),
        centerTitle: true,
        //elevation: 0.0,

        actions: [
          IconButton(
            onPressed: () {
              debugPrint("click");
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),

      //-------------------------------------------------------
      //2. menu
      //-------------------------------------------------------
      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.only(bottom: 20),
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/farmer_loop.png'),
                backgroundColor: Colors.white,
              ),
              accountEmail: Text("aa@naver.com"),
              accountName: Text("farmer"),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 176, 211, 240),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            //ListView
            createLeftOneMenu(context, "기본CounterApp", const CounterAppStep1()),
            const Divider(height: 5),
            createLeftOneMenu(context, "Provider", const ProviderStep2()),
            createLeftOneMenu(context, "ChangeNotifierProvider",
                const ChangeNotifierProviderStep3()),
            createLeftOneMenu(context, "ChangeNotifierProvider",
                const ChangeNotifierProviderStep4()),
            createLeftOneMenu(
                context, "ProviderExtension", const ProviderExtensionStep5()),
            const Divider(height: 5),
            createLeftOneMenu(
                context, "FutureProvider", const FutureProviderStep6()),
            createLeftOneMenu(
                context, "treamProvider", const StreamProviderStep7()),
            const Divider(height: 5),
            createLeftOneMenu(context, "Consumer", const ConsumerStep8()),
            createLeftOneMenu(
                context, "ConsumerException", const ConsumerExceptionStep9()),
            createLeftOneMenu(context, "Selector", const SelectorStep10()),
            const Divider(height: 5),
            createLeftOneMenu(context, "ProviderNotFoundException",
                const ProviderNotFoundExceptionStep11()),
            const Divider(height: 5),
            createLeftOneMenu(context, "AnonymousRouteAccess",
                const AnonymousRouteAccessStep12()),
            createLeftOneMenu(
                context, "NamedRouteAccess", NamedRouteAccessStep13()),
            createLeftOneMenu(
                context, "GeneratedRouteAccess", GeneratedRouteAccessStep14()),
            const Divider(height: 5),
            createLeftOneMenu(
                context, "ProxyProvider", const ProxyProviderStep15()),
            const Divider(height: 50),
          ],
        ),
      ),

      //-------------------------------------------------------
      //3. body
      //-------------------------------------------------------
      body: const Center(child: Text("Grid Template 모음집 \n메뉴를 클릭 하세요.")),
    );
  }

  //-------------------------------------------------------
  //@class 왼쪽 메뉴 라인 생성
  //-------------------------------------------------------
  Widget createLeftOneMenu(BuildContext context, String menuNm, Widget page) {
    return Center(
      child: SizedBox(
        height: 30,
        child: ListTile(
          title: Text(menuNm),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
            //Navigator.pop(context);
            //Route route = MaterialPageRoute(builder: (context) => ListViewStep10());
            //Navigator.pushReplacement(context, route);
          },
        ),
      ),
    );
  }
}
