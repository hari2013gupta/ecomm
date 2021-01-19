import 'dart:io';

import 'package:ecomm/ui/anim/fade_animS.dart';
import 'package:ecomm/ui/home/home_page.dart';
import 'package:ecomm/ui/login/database.dart';
import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/pref.dart';
import 'package:ecomm/ui/login/presenter/login_presenter.dart';
import 'package:ecomm/ui/login/test_db.dart';
import 'package:ecomm/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginViewContract {
  void startServiceInPlatform() async {
    if (Platform.isAndroid) {
      var methodChannel = MethodChannel("com.retroportalstudio.messages");
      String data = await methodChannel.invokeMethod("startService");
      debugPrint(data);
    }
  }

  TextEditingController mobileController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  LoginPresenter presenter;
  _LoginScreenState() {
    presenter = new LoginPresenter(this);
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeAnimation(
                        1.3,
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background-2.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ),
                  Container(
                    height: 90.0,
                    margin: EdgeInsets.all(10.0),
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Skip'),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.7,
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: mobileController,
                                maxLines: 1,
                                maxLength: 10,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number",
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    color: Colors.purple,
                                  ),
                                  hintStyle: kLabelStyleLight,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                controller: passwordController,
                                maxLines: 1,
                                maxLength: 10,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.purple,
                                  ),
                                  hintStyle: kLabelStyleLight,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.7,
                      Center(
                          child: Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),
                      ))),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.9,
                      GestureDetector(
                        onTap: () => {
                          //todo: code here----------------by hari
                          presenter.loadLoginService(),

                          //   Navigator.pop(context),
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => //TestDB())
                          //             MyHomePage(
                          //               title: 'Swadesi Shop',
                          //             )),
                          //   ),
                        },
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromRGBO(49, 39, 79, 1),
                          ),
                          child: Center(
                            child: Text('Login',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      2,
                      Center(
                          child: Text(
                        "Create Account",
                        style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),
                      ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getRecords() async {
    var res = await DBProvider.db.getAllCustomer();
    setState(() {
      startServiceInPlatform();

      showMessage('=========' + res.length.toString());
    });
  }

  @override
  void onLoadLoginComplete(Customer data) {
    // TODO: implement onLoadLoginComplete
    showMessage(getTokenSF().toString());
    _getRecords();

    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }

  @override
  void onLoadLoginError() {
    // TODO: implement onLoadLoginError
    setState(() {});
  }

  @override
  String getViewMobileNo() {
    // TODO: implement getViewMobileNo
    return mobileController.text;
    throw UnimplementedError();
  }

  @override
  String getViewPassword() {
    // TODO: implement getViewPassword
    return passwordController.text;
    throw UnimplementedError();
  }

  @override
  void hideProgress() {
    // TODO: implement hideProgress
  }

  @override
  void showMessage(String msg) {
    // TODO: implement showMessage
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void showProgress(String msg) {
    // TODO: implement showProgress
  }

  @override
  void showSnack(String msg) {
    // TODO: implement showSnack not work here hari
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(msg),
      action:
          SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ));
  }
}
