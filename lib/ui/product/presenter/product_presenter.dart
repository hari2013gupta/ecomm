
import 'package:ecomm/ui/product/di/depend_inj.dart';
import 'package:ecomm/ui/product/presenter/product_data.dart';

abstract class ProductListViewContract{
  void onLoadProductComplete(List<Product> items);
  void onLoadProductError();
}
class ProductListPresenter{
  ProductListViewContract view;
  ProductRepository repository;
  ProductListPresenter(this.view){
    repository = Injector().productRepository;
  }

  void loadProducts(){

    assert(view != null);

    repository.fetchProduct().then((items) => view.onLoadProductComplete(items))
    .catchError((onError) {
      print(onError);
      view.onLoadProductError();
    });
  }
}
