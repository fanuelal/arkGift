import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../widgets/order_items.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static final routeName = './orderScreen';

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.itemCounter,
        itemBuilder: (ctx, index) => OrderItems(
          order: ordersData.orderedItems[index],
        ),
      ),
    );
  }
}
