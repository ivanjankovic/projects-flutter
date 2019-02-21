import 'package:flutter/material.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.deleteProduct, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index].toString()),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
              print('Swiped start to end');
            } else {
              print('other swiping');
            }
          },
          background: Container(
            color: Colors.red[300],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(products[index]['image']),
            ),
            title: Text(products[index]['title']),
            subtitle: Text('\$${products[index]['price'].toString()}'),
            trailing: _buildEditButton(context, index),
          ),
        );
      },
      itemCount: products.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.indigo[200],
        );
      },
    );
  }

  IconButton _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage(
                product: products[index],
                updateProduct: updateProduct,
                productIndex: index,
              );
            },
          ),
        );
      },
    );
  }
}
