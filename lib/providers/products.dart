import 'package:flutter/material.dart';
import './product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class Products with ChangeNotifier {
  List<Product> _items = [
    //   Product(
    //       id: 'p01',
    //       name: "Iphone 12 Pro Max",
    //       Discription:
    //           "Pricing starts at 1,099. The iPhone 12 Pro Max is the largest phone of the iPhone 12 series. It has an A14 Bionic chip which has a 50% faster CPU and GPU. It has a 6.7-inch screen size which is the largest iPhone ever.",
    //       imgUrl: [
    //         "https://m.media-amazon.com/images/I/51EkZsk8XYL._AC_SX425_.jpg",
    //         "https://m.media-amazon.com/images/I/61tSnUoFeJL._AC_SX425_.jpg",
    //         "https://m.media-amazon.com/images/I/61DsANM1PaL._AC_SX425_.jpg"
    //       ],
    //       price: 1099,
    //       rate: 3,
    //       catagorizedIn: ['c1', 'c2', 'c3'],
    //       amount: 20),
    //   Product(
    //       id: 'p02',
    //       name: "SweatShirt",
    //       Discription:
    //           "Pricing starts at- The iPhone 12 Pro Max is the largest phone of the iPhone 12 series. It has an A14 Bionic chip which has a 50% faster CPU and GPU. It has a 6.7-inch screen size which is the largest iPhone ever.",
    //       imgUrl: [
    //         "https://m.media-amazon.com/images/I/81q+BsCSjTS._AC_UX522_.jpg",
    //         "https://m.media-amazon.com/images/I/81HuZ5kjt8S._AC_UX522_.jpg",
    //         "https://m.media-amazon.com/images/I/91BocnlI9mS._AC_UX522_.jpg"
    //       ],
    //       price: 55,
    //       rate: 4.0,
    //       catagorizedIn: ['c1', 'c2', 'c7'],
    //       amount: 70),
    //   Product(
    //       id: 'p03',
    //       name: "Godiva Chocolatier",
    //       Discription:
    //           "Rooted in our world-famous Belgian traditions, Godiva’s Gold Collection combines creative expertise with the latest techniques to deliver a luxurious chocolate experience for all. ",
    //       imgUrl: [
    //         "https://m.media-amazon.com/images/I/619x4qh5MzL._SX569_.jpg",
    //         "https://m.media-amazon.com/images/I/71q6VNrTPYL._SX679_.jpg",
    //         "https://www.pngitem.com/pimgs/m/212-2126804_clipart-present-sweet-box-hd-png-download.png",
    //       ],
    //       price: 13.66,
    //       rate: 3,
    //       catagorizedIn: ['c1', 'c2', 'c3'],
    //       amount: 70),
    //   Product(
    //       id: 'p04',
    //       name: "PUMA Unisex-Adult",
    //       Discription:
    //           "Great fit, super comfortable, purchased because of the smooth flat soles for ballroom dancing alternative to dress shoes and the material surround is super comfortable. Great purchase.",
    //       imgUrl: [
    //         "https://m.media-amazon.com/images/I/81ipPcn1l2L._AC_UX500_.jpg",
    //         "https://m.media-amazon.com/images/I/71KszHCZulL._AC_UY695_.jpg",
    //         "https://m.media-amazon.com/images/I/717Qg9zXs+L._AC_UY695_.jpg"
    //       ],
    //       price: 120,
    //       rate: 2.5,
    //       catagorizedIn: ['c1'],
    //       amount: 5),
    //   Product(
    //       id: 'p05',
    //       name: 'Aroma Flower',
    //       Discription:
    //           "AROMEO RED Roses Gift that Lasts | Fresh Flowers for Delivery Prime | Roses for Her, Mom, Girlfriend, Wife, Anniversary, Birthday, Wedding | Forever Rose Fresh Cut, Preserved Flowers (White Box RED Real & Hand-Picked - Our beautiful flower bouquets consist of fresh, hand-picked roses, which are subjected to an intricate process to maintain the integrity of the delicate rose petals. Made of 100% real flowers. Flowers for delivery prime same day.Premium Quality - This flower box serves as an elegant",
    //       imgUrl: [
    //         "https://m.media-amazon.com/images/I/71kmqZ66SiL._AC_SX679_.jpg",
    //         "https://m.media-amazon.com/images/I/712Rj6MMg9L._AC_SX679_.jpg",
    //         "https://m.media-amazon.com/images/I/919DpxrdaDL._AC_SX679_.jpg"
    //       ],
    //       price: 13,
    //       rate: 3,
    //       catagorizedIn: ['c1'],
    //       amount: 5),
    //   Product(
    //       id: 'p06',
    //       name: 'Acer Aspire 5 A515-46-R3UB',
    //       Discription:
    //           "Powerful Productivity: AMD Ryzen 3 3350U delivers desktop-class performance and amazing battery life in a slim notebook. With Precision Boost, get up to 3.5GHz for your high-demand applications Maximized Visuals: See even more on the stunning 15.6 Full HD display with 82.58% screen-to-body, 16:9 aspect ratio and narrow bezelsBacklit Keyboard and Fingerprint Reader: Biometric fingerprint reader and Windows Hello sign-in options help keep your Acer PC secure",
    //       imgUrl: [
    //         "https://m.media-amazon.com/images/I/7189iXimfWL.__AC_SY300_SX300_QL70_FMwebp_.jpg",
    //         "https://m.media-amazon.com/images/I/71J7ScSjhlL._AC_SX425_.jpg",
    //         "https://m.media-amazon.com/images/I/717-6cnCAmL._AC_SX425_.jpg"
    //       ],
    //       price: 120,
    //       rate: 2.5,
    //       catagorizedIn: ['c2'],
    //       amount: 5),
  ];
  var _showFavoritedItems = false;

  List<Product> get items {
    if (_showFavoritedItems) {
      return _items.where((productItem) => productItem.isFavorited).toList();
    }
    return [..._items];
  }

  void showFavoritedItem() {
    _showFavoritedItems = true;
    // notifyListeners();
  }

  void showAllProducts() {
    _showFavoritedItems = false;
  }

  Future<void> fetchAndSet() async {
    final url = Uri.parse(
        'https://arkgift-3867d-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.get(url);
      final fetchedData = json.encode(response.body) as Map<String, dynamic>;
      final List<Product> productsList = [];
      fetchedData.forEach((prodId, data) {
        productsList.add(Product(
          name: data['name'],
          price: data['price'],
          imgUrl: data['imgUrl'],
          Discription: data['Discription'],
        ));
      });
      _items = productsList;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Product findById(String productId) {
    return _items.firstWhere((item) => item.id == productId);
  }

  Future<void> addProduct(Product product) async {
    const urlStr =
        'https://arkgift-3867d-default-rtdb.firebaseio.com/products.json';
    final url = Uri.parse(urlStr);
    try {
      final response = await http.post(url,
          body: json.encode({
            'id': product.id,
            'name': product.name,
            'Discription': product.Discription,
            'imgUrl': product.imgUrl,
            'price': product.price,
          }));

      final newProdcut = Product(
        name: product.name,
        price: product.price,
        imgUrl: product.imgUrl,
        Discription: product.Discription,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProdcut);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void updateProduct(String id, Product product) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = product;
      notifyListeners();
    } else {
      print('no Index nothing edited');
    }
  }

  void deleteProduct(String productId) {
    _items.removeWhere((prod) => prod.id == productId);
    notifyListeners();
  }
}
