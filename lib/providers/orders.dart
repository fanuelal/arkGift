import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/cart_items.dart';
import 'cart.dart';
import './cart.dart';

class OrderItem {
  final String orderId;
  final double totalPrice;
  final List<CartItem> orderedItems;
  final DateTime orderTime;
  OrderItem(
      {@required this.orderId,
      @required this.totalPrice,
      @required this.orderedItems,
      @required this.orderTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orderedItems = [];

  List<OrderItem> get orderedItems {
    return [..._orderedItems];
  }
  int get itemCounter{
    return _orderedItems.length;
  }
  void addOrder(List<CartItem> productLists, double total) {
    _orderedItems.insert(
        0,
        OrderItem(
            orderId: DateTime.now().toString(),
            totalPrice: total,
            orderedItems: productLists,
            orderTime: DateTime.now()));
    notifyListeners();
  }

  void clear() {
    _orderedItems = [];
    notifyListeners();
  }
}
