class Product {
  final String product_name;
  final int product_id, product_mrp, product_price;

  const Product(
      {this.product_id,
      this.product_name,
      this.product_mrp,
      this.product_price});

  Product.fromMap(Map<String, dynamic> map)
      : product_id = map['product_id'],
        product_name = map['product_name'],
        product_mrp = map['product_mrp'],
        product_price = map['product_price'];
}

abstract class ProductRepository {
  Future<List<Product>> fetchProduct();
}

class FetchDataException implements Exception {
  String message;
  FetchDataException(this.message);
  String toString() {
    return 'Exception: $message';
  }
}
