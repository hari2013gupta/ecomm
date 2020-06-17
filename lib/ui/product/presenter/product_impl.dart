import 'dart:convert';
import 'package:ecomm/utils/my_constant.dart';
import 'package:ecomm/utils/my_exception.dart';
import 'package:http/http.dart' as http;

import 'package:ecomm/ui/product/presenter/product_data.dart';

class ProductRepositoryImpl implements ProductRepository {
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<List<Product>> fetchProduct() async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    String bodyString = jsonEncode(<String, String>{
      'cat': '1',
    });

    final response = await http.post(
      MyConstant.productUrl,
      headers: header,
      body: bodyString,
    );
    final jsonBody = response.body;
    final statusCode = response.statusCode;

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
