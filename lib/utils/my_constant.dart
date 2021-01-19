import 'package:flutter/material.dart';

class MyConstant {
  static const app_name = 'SwadesiShop';

  static const localhost = 'http://10.0.2.2:8000/';
  static const baseUrl = 'http://192.168.43.87:8000/';
  static const herokuUrl = 'https://swadesishop.herokuapp.com/';
  static const mainUrl = herokuUrl;
  static const productUrl = mainUrl + 'commonTableData';
  static const loginUrl = mainUrl + 'login';

  //All table added here
  //phase-I---------------Start 01stJune2020
  static const tcustomer = 'tbl_customer';
  static const tcart = 'tbl_cart';
  static const tcity = 'tbl_city';

  //All const added here---------------
  static const MSG_ALERT = 'Alert';
  static const MSG_ERROR = 'Error';
  static const MSG_SUCCESS = 'Success';
}

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
// const kSecondaryColor = Color(0xFF979797);
// const kTextColor = Color(0xFF757575);

const kSecondaryColor = Colors.blueGrey;
const kTextColor = Colors.blue;


const kAnimationDuration = Duration(milliseconds: 200);

const String kPhoneNumberNullError = "Please Enter your phone number";

const String kPhoneNumber10digit = "Please Enter 10 digit mobile number";
