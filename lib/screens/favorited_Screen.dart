import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/productGrid.dart';

class FavoritedScreen extends StatefulWidget {

  @override
  State<FavoritedScreen> createState() => _FavoritedScreenState();
}

class _FavoritedScreenState extends State<FavoritedScreen> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
      products.showFavoritedItem();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorited Products'),
      ),
      body: products.items.length == 0 ?  Center(child: Text('Nothing is Favorited!', style: TextStyle(color: Colors.grey, fontSize: 20),)) :ProductGrid(),
    );
  }
}
