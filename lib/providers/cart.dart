import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int amount;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.amount;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              amount: existingItem.amount + 1,
              price: existingItem.price * existingItem.amount));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              amount: 1));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((key, item) => item.id == productId);
    notifyListeners();
  }

  int get itemCounter {
    return _items.length;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeItems(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].amount > 1) {
      _items.update(
          productId,
          (existing) => CartItem(
              id: existing.id,
              title: existing.title,
              amount: existing.amount - 1,
              price: existing.price));
    } else {
      _items.remove(productId);
    }
  }
}
