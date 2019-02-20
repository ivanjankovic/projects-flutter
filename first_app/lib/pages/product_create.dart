import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField (
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
        print(_titleValue);
      },
    );
  }

  Widget _buildDescriptionTExtField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
        print(_titleValue);
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
        print(_titleValue);
      },
    );
  }

  void _submitForm() {
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final targetWidht = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = (deviceWidth - targetWidht) / 2;

    return Container(
      margin: EdgeInsets.all(15.0),
      child: Form(
        key:_formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTExtField(),
            _buildPriceTextField(),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              child: Text('Save'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white70,
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
