import 'package:contador/entities/Coffee.dart';

class CoffeeManager {
  static final CoffeeManager _instance = CoffeeManager._internal();

  factory CoffeeManager() {
    return _instance;
  }

  CoffeeManager._internal();

  final List<Coffee> coffeeList = [
    Coffee(name: 'Cappuccino', value: 10.0, isHot: true),
    Coffee(name: 'Espresso', value: 7.50, isHot: true),
    Coffee(name: 'Latte', value: 10.0, isHot: true),
    Coffee(name: 'Iced Latte', value: 12.0, isHot: false),
    Coffee(name: 'Macchiato', value: 12.0, isHot: true),
    Coffee(name: 'Americano', value: 7.50, isHot: true),
    Coffee(name: 'Cold Brew', value: 8.0, isHot: false),
    Coffee(name: 'Frappe', value: 14.0, isHot: false)
  ];

  List<Coffee> getCoffeeList() => coffeeList;

}