import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/productDetail_screen.dart';
import 'providers/catagories_provider.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_product_screen.dart';
import './screens/productEdit_screen.dart';
import './screens/tabBar.dart';
import './screens/products_sample_view.dart';

void main() => runApp(MyApp());
Map<int, Color> color = {
  50: Color.fromRGBO(4, 131, 184, .1),
  100: Color.fromRGBO(4, 131, 184, .2),
  200: Color.fromRGBO(4, 131, 184, .3),
  300: Color.fromRGBO(4, 131, 184, .4),
  400: Color.fromARGB(126, 40, 184, 4),
  500: Color.fromRGBO(4, 131, 184, .6),
  600: Color.fromRGBO(4, 131, 184, .7),
  700: Color.fromRGBO(4, 131, 184, .8),
  800: Color.fromRGBO(4, 131, 184, .9),
  900: Color.fromRGBO(4, 131, 184, 1),
};

class MyApp extends StatelessWidget {
  static MaterialColor themeColor = MaterialColor(0xFFA50029, color);
  static MaterialColor themeColorTransparent = MaterialColor(0xAAA50029, color);
  static MaterialColor themebackground = MaterialColor(0xFFededed, color);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
        ChangeNotifierProvider(create: (ctx) => Catagories())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: themeColor,
          backgroundColor: themebackground,
          accentColor: Colors.white,
          fontFamily: 'RobotoMono',
        ),
        home: TabBarScreen(),
        routes: {
          TabBarScreen.routeName: (ctx) => TabBarScreen(),
          ProductsSampleScreen.routeName: (ctx) => ProductsSampleScreen(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          UserEditingScreen.routeName: (ctx) => UserEditingScreen(),
        },
      ),
    );
  }
}
