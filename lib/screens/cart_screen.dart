import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  static final routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'total',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    "\$${cart.totalPrice.toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium
                            .color),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cart.items.values.toList(), cart.totalPrice);
                    cart.clear();
                  },
                  child: Text('Order Now'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) => CartItems(
              id: cart.items.values.toList()[index].id,
              name: cart.items.values.toList()[index].title,
              amount: cart.items.values.toList()[index].amount,
              price: cart.items.values.toList()[index].price),
        ))
      ]),
    );
  }
}
