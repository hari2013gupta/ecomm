import 'dart:convert';
import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/login/presenter/login_presenter.dart';
import 'package:ecomm/utils/my_constant.dart';
import 'package:ecomm/utils/my_exception.dart';
import 'package:http/http.dart' as http;

class LoginRepositoryImpl implements LoginRepository {
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<Customer> fetchLogin(String mobileNo, String password) async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Access-Control-Allow-Origin': '.htaccess',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
      // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
      "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT"
    };
    String bodyString = jsonEncode(<String, String> {
      'mobile': mobileNo,
      'password': password,
    });

    final response = await http.post(
      MyConstant.loginUrl,
      headers: header,
      body: bodyString,
    );
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          'Error while getting data [code:$statusCode, Error:${response.reasonPhrase}]');
    }
    final productContainer = _decoder.convert(jsonBody);
    final int code = productContainer['code'];
    if (code != 200) {
      final String message = productContainer['message'];
      final String msg = 'Message: [code:$code, Alert:$message]';
      // view.showMessage(msg);
      throw new FetchDataException(msg);
    }
    final String data = productContainer['data'];
    Customer c = new Customer(token: data);
    return c;
  }

  LoginViewContract view;
  @override
  void loginView(LoginViewContract view) {
    // TODO: implement loginView
    this.view = view;
  }
}
