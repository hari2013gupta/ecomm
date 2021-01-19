import 'package:ecomm/size_config.dart';
import 'package:ecomm/ui/login/component/body.dart';
import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/presenter/login_presenter.dart';
import 'package:flutter/material.dart';

class LoginScr extends StatelessWidget implements LoginViewContract {
  LoginPresenter presenter;
  _LoginScreenState() {
    presenter = new LoginPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Inn"),
      ),
      body: Body(),
    );
  }

  @override
  String getViewMobileNo() {
    // TODO: implement getViewMobileNo
    throw UnimplementedError();
  }

  @override
  String getViewPassword() {
    // TODO: implement getViewPassword
    throw UnimplementedError();
  }

  @override
  void hideProgress() {
    // TODO: implement hideProgress
  }

  @override
  void onLoadLoginComplete(Customer data) {
      // TODO: implement onLoadLoginComplete
    }
  
    @override
    void onLoadLoginError() {
      // TODO: implement onLoadLoginError
    }
  
    @override
    void showMessage(String msg) {
      // TODO: implement showMessage
    }
  
    @override
  void showProgress(String msg) {
      // TODO: implement showProgress
    }
  
    @override
  
    void showSnack(String msg) {
    // TODO: implement showSnack
  }
}