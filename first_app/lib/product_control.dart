import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        addProduct('Sweets');
      },
      child: Text('Add Product'),
      color: Theme.of(context).primaryColor,
    );
  }
}
