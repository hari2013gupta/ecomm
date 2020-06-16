import 'package:ecomm/ui/product/presenter/product_data.dart';
import 'package:ecomm/ui/product/presenter/product_presenter.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: ProductList(),
    );
  }
}

//
//List
//
class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key: key);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    implements ProductListViewContract {
  ProductListPresenter presenter;
  List<Product> productList;
  bool isLoading;

  _ProductListState() {
    presenter = ProductListPresenter(this);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    presenter.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (isLoading) {
      widget = Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      widget = ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _buildProductList(),
      );
    }
    return widget;
  }

  List<ProductListItem> _buildProductList() {
    return productList.map((product) => ProductListItem(product)).toList();
  }

  @override
  void onLoadProductComplete(List<Product> items) {
    // TODO: implement onLoadProductComplete
    setState(() {
      productList = items;
      isLoading = false;
    });
  }

  @override
  void onLoadProductError() {
    // TODO: implement onLoadProductError
    print('--------------onLoadProductError product_view');
    setState(() {
      isLoading = false;
    });
  }
}

//
//Item
//
class ProductListItem extends ListTile {
  ProductListItem(Product product)
      : super(
            title: Text(product.productName),
            subtitle: Text(product.productMrp.toString()),
            leading: CircleAvatar(
              child: Text(product.productName[0]),
            ));
}
