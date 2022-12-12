/*
   @ factory pattern을 사용하지 않은 소스
*/
import 'package:flutter/material.dart';

enum PizzaType { HanMushroom, Deluxe, Seafood }

abstract class Pizza {
  double getPrice();
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
  //test('Counter test', () async {
  var userSelectedPizza = PizzaType.HanMushroom;
  var orderNumber = '1234';
  Pizza pizza;
  switch (userSelectedPizza) {
    case PizzaType.HanMushroom:
      pizza = HamAndMushrooPizza();
      break;
    case PizzaType.Deluxe:
      pizza = DeluxePizza(orderNumber);
      break;
    case PizzaType.Seafood:
      pizza = SeafoodPizza();
      break;
  }
  print(pizza.getPrice());
  //});
}
