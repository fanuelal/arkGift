import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String Discription;
  final List<String> imgUrl;
  final double price;
  final double rate;
  final List<String> catagorizedIn;
  bool isFavorited;
  final int amount;

  Product(
      {@required this.id,
      @required this.name,
      @required this.Discription,
      @required this.imgUrl,
      @required this.price,
      @required this.rate,
      @required this.catagorizedIn,
      @required this.amount,
      this.isFavorited});

  void toggleFavoirite() {
    isFavorited = !isFavorited;
    notifyListeners();
  }
}
