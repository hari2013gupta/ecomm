import 'package:ecomm/ui/login/database.dart';
import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/pref.dart';
import 'package:ecomm/ui/product/di/depend_inj.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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
              print("Response 200------------>" + data.token),
              saveTokenToSF(data.token),
              updateData(data),
              DBProvider.db.newCustomer(data),
              view.onLoadLoginComplete(data),
            })
        .catchError((onError) {
      print("Error------------>" + onError.toString());
      view.showMessage(onError.toString());
      view.onLoadLoginError();
    });
  }

  updateData(Customer data) {
    String token = data.token;
    bool isTokenExpired = JwtDecoder.isExpired(token);

    if (!isTokenExpired) {
      // The user should authenticate
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      // Now you can use your decoded token
      print('iat====> ${decodedToken['iat']}');
      print('exp====> ${decodedToken['exp']}');
      Map<String, dynamic> objectValue = decodedToken['0'];

      print('user_id====> ${objectValue['user_id']}');
      data.userId = objectValue["user_id"];
      data.userMobile = objectValue["user_mobile"];
      data.userName = objectValue["user_name"];
      data.userEmail = objectValue["user_email"];
      data.userOTP = objectValue["user_otp"];
      data.userPassword = objectValue["user_password"];
      data.deviceToken = objectValue["device_token"];
      data.userPhoto = objectValue["user_photo"];
      bool a, b;
      if (objectValue["user_active"] == 1) {
        a = true;
      } else {
        a = false;
      }
      if (objectValue["block_status"] == 0) {
        b = true;
      } else {
        b = false;
      }
      data.isActive = a;
      data.blockStatus = b;
      // data.userName = objectValue["is_deleted"];
      data.userRemark = objectValue["user_remark"];
      data.userCreatedAt = objectValue["created_at"];
      data.userUpdatedAt = objectValue["updated_at"];
    }
  }
}
