import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/user_Product_item.dart';
import '../widgets/app_drawer.dart';
import './productEdit_screen.dart';

class UserProductScreen extends StatelessWidget {
  static final routeName = '/userProduct';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage product'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(UserEditingScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                UserProductItem(
                  id: productData.items[index].id,
                  title: productData.items[index].name,
                  imgUrl: productData.items[index].imgUrl[0],
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
