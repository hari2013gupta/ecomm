import 'dart:convert';

import 'package:ecomm/ui/login/presenter/login_presenter.dart';

Customer customerFromJson(String str) {
  final jsonData = json.decode(str);
  return Customer.fromMap(jsonData);
}

String customerToJson(Customer data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Customer {
  int id;
  int userId;
  String userName;
  String userPhoto;
  String userPassword;
  String userRating;
  String token;
  bool isActive;
  bool blockStatus;

  Customer({
    this.id,
    this.userId,
    this.userName,
    this.userPhoto,
    this.userPassword,
    this.userRating,
    this.token,
    this.isActive,
    this.blockStatus,
  });

  factory Customer.fromMap(Map<String, dynamic> json) => new Customer(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        userPhoto: json["user_photo"],
        userPassword: json["user_password"],
        userRating: json["user_rating"],
        token: json["data"],
        isActive: json["is_active"] == 1,
        blockStatus: json["block_status"] == 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "user_photo": userPhoto,
        "user_password": userPassword,
        "user_rating": userRating,
        "data": token,
        "is_active": isActive,
        "block_status": blockStatus,
      };
}

abstract class LoginRepository {
  void loginView(LoginViewContract view);
  Future<Customer> fetchLogin(String mobile, String password);
}

