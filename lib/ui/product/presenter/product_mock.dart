import 'package:ecomm/ui/product/presenter/product_data.dart';
import 'package:ecomm/utils/my_exception.dart';

class MockProductRepository implements ProductRepository{
  @override
  Future<List<Product>> fetchProduct() {
    return Future.value(kProducts);
    throw new FetchDataException('Exception occured');
  }
}

const kProducts = <Product>[
  Product(productName: 'Product-1',productId: 11,productMrp: 1100,productPrice: 190),
  Product(productName: 'Product-2',productId: 12,productMrp: 1200,productPrice: 290),
  Product(productName: 'Product-3',productId: 13,productMrp: 1300,productPrice: 390),
  Product(productName: 'Product-4',productId: 14,productMrp: 1400,productPrice: 490),
  Product(productName: 'Product-5',productId: 15,productMrp: 1500,productPrice: 590),
  Product(productName: 'Product-6',productId: 16,productMrp: 1600,productPrice: 690),
  Product(productName: 'Product-7',productId: 17,productMrp: 1700,productPrice: 790),
  Product(productName: 'Product-8',productId: 18,productMrp: 1800,productPrice: 890),
  Product(productName: 'Product-9',productId: 19,productMrp: 1900,productPrice: 990),
];