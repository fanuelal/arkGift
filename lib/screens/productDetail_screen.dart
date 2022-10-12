import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../providers/cart.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/product-detail';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var activeImageNav = 0;

  Widget imgSliderButton(BuildContext ctx, int index, String imgUrl) {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeImageNav = index;
        });
      },
      child: Opacity(
        opacity: index == activeImageNav ? 0.5 : 1,
        child: Container(
          // alignment: Alignment.center,
          height: index == activeImageNav ? 70 : 50,
          width: index == activeImageNav ? 70 : 50,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            border: index == activeImageNav
                ? Border.all(color: Theme.of(context).primaryColor, width: 2)
                : Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: FittedBox(
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(productId);
    final cartItem = Provider.of<Cart>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.name),
        ),
        body: Builder(
          builder: (ctx) => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 305,
                    width: 300,
                    child: FittedBox(
                      child: Image.network(
                        loadedProduct.imgUrl[activeImageNav],
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Row(children: [
                    SizedBox(
                      width: 55,
                    ),
                    imgSliderButton(context, 0, loadedProduct.imgUrl[0]),
                    imgSliderButton(context, 1, loadedProduct.imgUrl[1]),
                    imgSliderButton(context, 2, loadedProduct.imgUrl[2]),
                  ]),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: RatingBar.builder(
                          initialRating: loadedProduct.rate,
                          itemSize: 20,
                          minRating: 1,
                          itemPadding: EdgeInsets.symmetric(horizontal: 5),
                          itemBuilder: (context, _) =>
                              Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {},
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\$${loadedProduct.price}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                      Divider(),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.75, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            '${loadedProduct.Discription}',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        cartItem.addItem(loadedProduct.id, loadedProduct.price,
                            loadedProduct.name);
                        // Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Row(
                              children: [
                                Text(
                                  'Item add to you Cart!',
                                  textAlign: TextAlign.center,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.shopping_cart)),
                              ],
                            ),
                            width: 400,
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'undo',
                              onPressed: () {
                                cartItem.removeSingleItem(loadedProduct.id);
                              },
                            ));
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 70),
                        textStyle: TextStyle(),
                        primary: Theme.of(context).primaryColor,
                        onPrimary: Colors.white,
                      ),
                      label: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
