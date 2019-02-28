import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-models/main.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.allProducts[index].toString()),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct();
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
                  backgroundImage: NetworkImage(model.allProducts[index].image),
                ),
                title: Text(model.allProducts[index].title),
                subtitle: Text('\$${model.allProducts[index].price.toString()}'),
                trailing: _buildEditButton(context, index, model),
              ),
            );
          },
          itemCount: model.allProducts.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.indigo[200],
            );
          },
        );
      },
    );
  }

  Widget _buildEditButton(
      BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage();
            },
          ),
        );
      },
    );
  }
}
