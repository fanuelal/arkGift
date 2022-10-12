import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    // var size = MediaQuery.of(context).size;
    return Container(
      height: 535,
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12),
      ),
    );
  }
}
