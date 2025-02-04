import 'package:contador/entities/Coffee.dart';

class CafeteriaTable {

  int number;
  List<Coffee> orders = [];
  double totalAmount = 0.0;

  CafeteriaTable({required this.number});

  int get getNumber => number;
  List<Coffee> get getOrders => orders;
  double get getTotalAmount => totalAmount;

  void addOrder(Coffee coffee) {
    orders.add(coffee);
    totalAmount += coffee.getValue;
  }

  void removerOrder(Coffee coffee) {
    orders.remove(coffee);
    totalAmount -= coffee.getValue;
  }

  void clearOrders() => orders.clear();

  void clearTotalAmount() => totalAmount = 0.0;

}