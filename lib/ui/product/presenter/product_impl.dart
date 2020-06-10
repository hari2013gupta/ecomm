import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ecomm/ui/product/presenter/product_data.dart';

class ProductRepositoryImpl implements ProductRepository {
  static const _productUrl = 'product';
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<Product>> fetchProduct() async {
    final response = await http.get(_productUrl);
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    // TODO: implement fetchProduct
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          'Error while getting products [status_code:$statusCode, Error:${response.reasonPhrase}]');
    }
    final productContainer = _decoder.convert(jsonBody);
    final List productItems = productContainer['data'];
    return productItems
        .map((productRow) => Product.fromMap(productRow))
        .toList();
  }
}
