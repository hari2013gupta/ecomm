import 'package:ecomm/utils/my_constant.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    
    fontFamily: 'RobotoMono',
    primarySwatch: Colors.deepPurple,
    accentColor: Colors.purpleAccent,
    primaryColor: Colors.purple,
    primaryColorDark: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey[850], //(0xFFF3F5F7),
    brightness: Brightness.dark,
    // appBarTheme: AppBarTheme(
    //   color: Colors.white,
    //   elevation: 0,++
    //   brightness: Brightness.light,
    //   textTheme: GoogleFonts.latoTextTheme().apply(
    //     bodyColor: Colors.black,
    //   ),
    //   iconTheme: IconThemeData(color: Colors.black),
    // ),
    // textTheme: GoogleFonts.latoTextTheme(),
  
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
      // headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      // title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      // body1: TextStyle(fontSize: 14.0, fontFamily: 'Raleway'),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}
