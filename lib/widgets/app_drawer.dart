import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/user_product_screen.dart';
import '../screens/tabBar.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Container(
              height: 300,
              child: Text('Main Drawer')),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.75),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopify_sharp),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed(TabBarScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(OrdersScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard_customize),
            title: Text('Manage products'),
            onTap: () {
              Navigator.of(context).pushNamed(UserProductScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
