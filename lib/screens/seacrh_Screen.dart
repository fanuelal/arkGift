import 'package:flutter_complete_guide/providers/cart.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/productGrid.dart';
import '../widgets/badge.dart';
import '../providers/catagories_provider.dart';

enum menuOption { favorited, All }

class SearchScreen extends StatelessWidget {
  static final routeName = '/sampleView';
  TextEditingController _searchedFieldController = TextEditingController();
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
          'Explore Gifts',
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
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      child: FittedBox(
                        // child: Image.network(src),
                      ),
                    ),
                    Container(),
                    Container(),
                  ],
                ),
                // child: Card(),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: _searchedFieldController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(
                        fontSize: 20, color: Theme.of(context).primaryColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        
                    suffixIcon: IconButton(
                      onPressed: () {
                        print("clicked");
                      },
                      icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.bottomLeft,
              //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              //   child: Text(
              //     "Best Selling",
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 28,
              //         color: Theme.of(context).primaryColor),
              //     textAlign: TextAlign.left,
              //   ),
              // ),
              ProductGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
