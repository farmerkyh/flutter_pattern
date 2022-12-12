//   https://www.youtube.com/watch?v=ICaYCojSPko
import 'package:flutter/material.dart';
/*
   @ factory pattern을 사용한 소스
*/

enum PizzaType { HanMushroom, Deluxe, Seafood }

abstract class Pizza {
  double getPrice();

  //static pizzaFactory(Map<String, dynamic> json) {
  factory Pizza.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as PizzaType) {
      case PizzaType.HanMushroom:
        return HamAndMushrooPizza();
      case PizzaType.Deluxe:
        return DeluxePizza(json['orderNumber']);
      case PizzaType.Seafood:
        return SeafoodPizza();
      default:
        return SeafoodPizza();
    }
  }
}

class HamAndMushrooPizza implements Pizza {
  double price = 10.5;
  @override
  double getPrice() {
    return price;
  }
}

class DeluxePizza implements Pizza {
  late String orderNumber; //DeluxePizza만 주문번호 존재
  DeluxePizza(this.orderNumber);
  double price = 5.5;
  @override
  double getPrice() {
    return price;
  }
}

class SeafoodPizza implements Pizza {
  double price = 7.8;
  @override
  double getPrice() {
    return price;
  }
}

//피자가게에서 피자를 주문하고 그 가격을 출력해주는 예제
void main() {
  //아래와 같이 Factory pattern을 정의하면 장점
  //  1. Pizza객체가 3개가 있는데, 개발자가 3개를 계속 제어할 필요없이 바로 사용이 가능하다.
  //  2. 만약, pizza종류가 늘어나면, pizzaFactory만 수정하면 되지만
  //     이전 소스(factory_step100.dar)는 switch(..)이 쓰이는 곳을 모두 찾아서 수정해줘야 된다.
  Map<String, dynamic> json = {'type': PizzaType.Deluxe, 'orderNumber': '1234'};
  //print(Pizza.pizzaFactory(json).getPrice());
  print(Pizza.fromJson(json).getPrice());
}
