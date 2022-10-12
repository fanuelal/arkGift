import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final int amount;

  const CartItems({this.id, this.name, this.price, this.amount});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete_forever_sharp, color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to remove the item from the cart?'),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No')),
            FlatButton(onPressed: () {
              Navigator.of(ctx).pop(true);
            }, child: Text('Yes')),
                ]
                 ),
                 
                ),
     onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text("$amount"),
                ),
              ),
            ),
            title: Text(name),
            subtitle: Text('\$${price * amount}'),
            trailing: Text("${amount} X"),
          ),
        ),
      ),
    );
  }
}
