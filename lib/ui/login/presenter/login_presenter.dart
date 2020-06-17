import 'package:ecomm/ui/login/database.dart';
import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/pref.dart';
import 'package:ecomm/ui/product/di/depend_inj.dart';

abstract class LoginViewContract {
  void onLoadLoginComplete(Customer data);
  void onLoadLoginError();
  String getViewMobileNo();
  String getViewPassword();
  void showProgress(String msg);
  void hideProgress();
  void showSnack(String msg);
  void showMessage(String msg);
}

class LoginPresenter {
  LoginViewContract view;
  LoginRepository repository;

  LoginPresenter(this.view) {
    repository = Injector().loginRepository;
    repository.loginView(view);
  }

  void loadLoginService() {
    assert(view != null);
    if (view.getViewMobileNo().length < 10) {
      view.showMessage('Please enter correct mobile number!');
      return;
    } else if (view.getViewPassword().length < 4) {
      view.showMessage('Password length should be of minimum 4 character!');
      return;
    }
    repository
        .fetchLogin(view.getViewMobileNo(), view.getViewPassword())
        .then((data) => {
              saveToken(data.token),
              DBProvider.db.newCustomer(data),
              view.onLoadLoginComplete(data),
            })
        .catchError((onError) {
      view.showMessage(onError.toString());
      view.onLoadLoginError();
    });
  }
}
