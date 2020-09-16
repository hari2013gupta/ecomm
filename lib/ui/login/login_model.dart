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
  String userMobile;
  String userEmail;
  String userPhoto;
  String userOTP;
  String userPassword;
  String deviceToken;
  String userRating;
  String userRemark;
  String userCreatedAt;
  String userUpdatedAt;
  String token;
  bool isActive;
  bool blockStatus;

  Customer({
    this.id,
    this.userId,
    this.userMobile,
    this.userEmail,
    this.userName,
    this.userPhoto,
    this.userOTP,
    this.userPassword,
    this.userRating,
    this.userRemark,
    this.userCreatedAt,
    this.userUpdatedAt,
    this.deviceToken,
    this.token,
    this.isActive,
    this.blockStatus,
  });

  factory Customer.fromMap(Map<String, dynamic> json) => new Customer(
        id: json["id"],
        userId: json["user_id"],
        userMobile: json["user_mobile"],
        userEmail: json["user_email"],
        userName: json["user_name"],
        userPhoto: json["user_photo"],
        userOTP: json["user_otp"],
        userPassword: json["user_password"],
        deviceToken: json["device_token"],
        userRating: json["user_rating"],
        userRemark: json["user_remark"],
        userCreatedAt: json["created_at"],
        userUpdatedAt: json["updated_at"],
        token: json["data"],
        isActive: json["is_active"] == 1,
        blockStatus: json["block_status"] == 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "user_mobile": userMobile,
        "user_email": userEmail,
        "user_photo": userPhoto,
        "user_otp": userOTP,
        "user_password": userPassword,
        "device_token": deviceToken,
        "user_rating": userRating,
        "user_remark": userRemark,
        "created_at": userCreatedAt,
        "updated_at": userUpdatedAt,
        "data": token,
        "is_active": isActive,
        "block_status": blockStatus,
      };
}

abstract class LoginRepository {
  void loginView(LoginViewContract view);
  Future<Customer> fetchLogin(String mobile, String password);
}

