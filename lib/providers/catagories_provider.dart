import 'package:flutter/material.dart';
import './catagory.dart';

class Catagories extends ChangeNotifier {
  List<Catagory> _items = [
    Catagory(
        id: 'c1',
        title: 'BirthDay Gifts',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c2',
        title: 'Couple Gifts',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c3',
        title: 'Random Gifts',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c4',
        title: 'Electronics Gifts',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c5',
        title: 'Meal Gifts',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c6',
        title: 'Child Gifts',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c7',
        title: 'For Male',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
    Catagory(
        id: 'c8',
        title: 'For Female',
        imgUrl:
            'https://www.pngkey.com/png/full/2-22097_happy-birthday-png-pic-happy-birthday-image-png.png'),
  ];
  List<Catagory> get items {
    return [..._items];
  }

  Catagory findById(String cataId) {
    return _items.firstWhere((catagory) => catagory.id == cataId);
  }
}
