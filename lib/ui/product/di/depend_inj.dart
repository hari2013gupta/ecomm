import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/presenter/login_impl.dart';
import 'package:ecomm/ui/login/presenter/login_mock.dart';
import 'package:ecomm/ui/product/presenter/product_data.dart';
import 'package:ecomm/ui/product/presenter/product_impl.dart';
import 'package:ecomm/ui/product/presenter/product_mock.dart';

enum Flavor { MOCK, PRO }
//
///DI
//
class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }
  Injector._internal();

  ProductRepository get productRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockProductRepository();
      default: //Flavor.PRO:
        return ProductRepositoryImpl();
    }
  }
  LoginRepository get loginRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockLoginRepository();
      default: //Flavor.PRO:
        return LoginRepositoryImpl();
    }
  }
}
