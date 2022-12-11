import 'package:flutter_test/flutter_test.dart';

//피자가게에서 피자를 주문하고 그 가격을 출력해주는 예제
void main() {
  print("1");
  test('Counter test', () async {
    print("2");
    var userSelectedPizza = PizzaType.HanMushroom;

    Pizza pizza;
    switch (userSelectedPizza) {
      case PizzaType.HanMushroom:
        print("HanMushroom");
        pizza = HamAndMushrooPizza();
        break;
      case PizzaType.Deluxe:
        pizza = DeluxePizza();
        break;
      case PizzaType.Seafood:
        pizza = SeafoodPizza();
        break;
    }
    print(pizza.getPrice());
  });
}

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
