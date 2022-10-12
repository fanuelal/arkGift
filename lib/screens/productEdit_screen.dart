import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class UserEditingScreen extends StatefulWidget {
  static final routeName = '/editScreen';
  @override
  State<UserEditingScreen> createState() => _UserEditingScreenState();
}

class _UserEditingScreenState extends State<UserEditingScreen> {
  var _priceFocusNode = FocusNode();
  var _descriptionFocusNode = FocusNode();
  var _imageUrlController = TextEditingController();
  var _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _isLoading = false;
  var _editedProduct = Product(
      id: null,
      name: '',
      Discription: '',
      imgUrl: [''],
      price: 0,
      rate: 1,
      catagorizedIn: ['c1'],
      amount: 0);
  var initValue = {
    'name': '',
    'discription': '',
    'price': '',
    'imgUrl': [],
  };
  @override
  void initState() {
    _imageFocusNode.addListener(updateImgUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        initValue = {
          'name': _editedProduct.name,
          'discription': _editedProduct.Discription,
          'price': _editedProduct.price.toString(),
          'imgUrl': '',
        };
        _imageUrlController.text = _editedProduct.imgUrl[0].toString();
      }
    }

    _isInit = false;
  }

  @override
  void dispose() {
    _imageFocusNode.removeListener(updateImgUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void updateImgUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  Future<void> saveForm() async {
    setState(() {
      _isLoading = true;
    });
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      Navigator.of(context).pop();
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (err) {
        return showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Error occured'),
                  content: Text('Something went wrong during adding contents.'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Ok"))
                  ],
                ));
      } finally {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      }
    }
    // Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () {
                saveForm();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: initValue['name'],
                      decoration: InputDecoration(
                        labelText: 'title',
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'provide title for product';
                        } else
                          return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            name: value,
                            Discription: _editedProduct.Discription,
                            imgUrl: _editedProduct.imgUrl,
                            price: _editedProduct.price,
                            rate: _editedProduct.rate,
                            catagorizedIn: _editedProduct.catagorizedIn,
                            amount: _editedProduct.amount,
                            isFavorited: _editedProduct.isFavorited);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue: initValue['price'],
                      decoration: InputDecoration(
                        labelText: 'price',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            name: _editedProduct.name,
                            Discription: _editedProduct.Discription,
                            imgUrl: _editedProduct.imgUrl,
                            price: double.parse(value),
                            rate: _editedProduct.rate,
                            catagorizedIn: _editedProduct.catagorizedIn,
                            amount: _editedProduct.amount,
                            isFavorited: _editedProduct.isFavorited);
                      },
                      validator: (value) {
                        if (value.isEmpty) return 'provide price';
                        if (double.tryParse(value) == null)
                          return 'enter valid number';
                        if (double.parse(value) <= 30)
                          return 'enter valid price';
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: initValue['discription'],
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            name: _editedProduct.name,
                            Discription: value,
                            imgUrl: _editedProduct.imgUrl,
                            price: _editedProduct.price,
                            rate: _editedProduct.rate,
                            catagorizedIn: _editedProduct.catagorizedIn,
                            amount: _editedProduct.amount,
                            isFavorited: _editedProduct.isFavorited);
                      },
                      validator: (value) {
                        if (value.isEmpty) return 'provide description please';
                        if (value.length < 10)
                          return 'provide more than 10 character';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 3,
                                  color: Theme.of(context).primaryColor)),
                          child: _imageUrlController.text.isEmpty
                              ? Center(
                                  child: Text(
                                  'Preview',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 20),
                                ))
                              : FittedBox(
                                  child: Image.network(
                                    _imageUrlController.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Image Url',
                              ),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageUrlController,
                              onFieldSubmitted: (_) {
                                saveForm();
                              },
                              onSaved: (value) {
                                _editedProduct = Product(
                                    id: _editedProduct.id,
                                    name: _editedProduct.name,
                                    Discription: _editedProduct.Discription,
                                    imgUrl: [value],
                                    price: _editedProduct.price,
                                    rate: _editedProduct.rate,
                                    catagorizedIn: _editedProduct.catagorizedIn,
                                    amount: _editedProduct.amount,
                                    isFavorited: _editedProduct.isFavorited);
                              },
                              validator: (value) {
                                if (value.isEmpty) return 'provide Image url';
                                if (!value.startsWith('http') &&
                                    !value.startsWith('https'))
                                  return 'enter valid url';
                                if (!value.endsWith('.jpg') &&
                                    !value.endsWith('.png')) {
                                  return 'Enter the imgae format with png or jpg';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
