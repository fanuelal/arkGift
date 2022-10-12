import 'dart:js';

import 'package:flutter_complete_guide/providers/cart.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:flutter/material.dart';
import '../widgets/productGrid.dart';
import '../widgets/badge.dart';
import '../providers/catagories_provider.dart';

enum menuOption { favorited, All }

class ProductsSampleScreen extends StatefulWidget {
  static final routeName = '/sampleView';
  // @override
  // void initState() {
  //   // Future.delayed(Duration.zero).then((_) {
  //   //   Provider.of<Products>(context).fetchAndSet();
  //   // });
  // }
  // didCha

  @override
  State<ProductsSampleScreen> createState() => _ProductsSampleScreenState();
}

class _ProductsSampleScreenState extends State<ProductsSampleScreen> {
  var _isinit = true;
  var _isLoading = false;
  Widget CatagoryItem(BuildContext ctx, String title, IconData iconType) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Chip(
        backgroundColor: Colors.white,
        label: Text(
          title,
          style: TextStyle(
            color: Theme.of(ctx).primaryColor,
          ),
        ),
        avatar: Icon(
          iconType,
          color: Theme.of(ctx).primaryColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final catagoryData = Provider.of<Catagories>(context, listen: false).items;
    @override
    void didChangeDependencies() {
      if (_isinit) {
        setState(() {
          _isLoading = true;
        });
        Provider.of<Products>(context).fetchAndSet().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      }
    }

    productData.showAllProducts();
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu_sharp),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Theme.of(context).primaryColor,
          );
        }),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Ark Gift',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(child: ch, value: cart.itemCounter.toString()),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: 700,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  "Catagories",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.left,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CatagoryItem(context, catagoryData[0].title, Icons.cake),
                    CatagoryItem(
                        context, catagoryData[1].title, Icons.favorite),
                    CatagoryItem(
                        context, catagoryData[3].title, Icons.computer),
                    CatagoryItem(
                        context, catagoryData[4].title, Icons.set_meal),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  "Best Selling",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.left,
                ),
              ),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
