import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
import '../screens/productDetail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../main.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cartItem = Provider.of<Cart>(context, listen: false);
    if (product.isFavorited == null) product.isFavorited = false;
    return Card(
      elevation: 4,
      child: Container(
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetail.routeName, arguments: product.id);
              },
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    
                    child: Image.network(
                    product.imgUrl[0],
                    fit: BoxFit.cover,
                    
                    ),
                  ),
                Positioned(
                  child: Consumer<Product>(
                  builder: (ctx, product, child) => IconButton(
                   icon: Icon(
                       product.isFavorited ? Icons.favorite : Icons.favorite_border, color: Theme.of(context).primaryColor),
                   onPressed: () => product.toggleFavoirite(),
                  ),
                              ),
                ),
                ],
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.white,
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart, color: Theme.of(context).primaryColor),
                onPressed: () {
                  cartItem.addItem(product.id, product.price, product.name);
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Item add to you Cart!',
                        textAlign: TextAlign.center,
                      ),
                      
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'undo',
                        onPressed: () {
                          cartItem.removeSingleItem(product.id);
                        },
                      ),
                    ),
                  );
                },
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                product.name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
