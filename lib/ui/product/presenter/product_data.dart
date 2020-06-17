import 'dart:convert';

Product productFromJson(String str) {
  final jsonData = json.decode(str);
  return Product.fromMap(jsonData);
}

String productToJson(Product data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Product {
  final String productName,
      productTitle,
      productImage,
      productWeight,
      productUnit,
      productMax;
  final int databaseId, productId, productMrp, productPrice;
  final bool productActive;

  const Product(
      {this.databaseId,
      this.productId,
      this.productName,
      this.productTitle,
      this.productImage,
      this.productWeight,
      this.productUnit,
      this.productMax,
      this.productMrp,
      this.productPrice,
      this.productActive});

  Product.fromMap(Map<String, dynamic> map)
      : databaseId = map['database_id'],
        productId = map['product_id'],
        productName = map['product_name'],
        productTitle = map['product_title'],
        productImage = map['product_image'],
        productWeight = map['product_weight'],
        productUnit = map['product_unit'],
        productMax = map['product_max'],
        productMrp = map['product_mrp'],
        productPrice = map['product_price'],
        productActive = map['product_active'] == 1;

  Map<String, dynamic> toMap() => {
        "database_id": databaseId,
        "product_id": productId,
        "product_name": productName,
        "product_title": productTitle,
        "product_image": productImage,
        "product_weight": productWeight,
        "product_unit": productUnit,
        "product_mrp": productMrp,
        "product_price": productPrice,
        "product_active": productActive
      };
}

abstract class ProductRepository {
  Future<List<Product>> fetchProduct();
}
