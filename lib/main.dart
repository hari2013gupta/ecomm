import 'package:ecomm/ui/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'SOI4U';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        fontFamily: 'RobotoMono',
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purpleAccent,
        primaryColor: Colors.purple,
        primaryColorDark: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[850], //(0xFFF3F5F7),
        brightness: Brightness.dark,
        // appBarTheme: AppBarTheme(
        //   color: Colors.white,
        //   textTheme: GoogleFonts.latoTextTheme().apply(
        //     bodyColor: Colors.black,
        //   ),
        //   iconTheme: IconThemeData(color: Colors.black),
        // ),
        // textTheme: GoogleFonts.latoTextTheme(),
        // textTheme: TextTheme(
        //   headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   body1: TextStyle(fontSize: 14.0, fontFamily: 'Raleway'),
        // ),
      ),
      // routes: <String, WidgetBuilder>{
      //   '/page2': (BuildContext context) => Page2(title: 'Page2'),
      // },
      // home: MyHomePage(title: appTitle),
      home: SplashScreen(),
      // home: CarouselDemo(),
      // home: GridOrientation(title: appTitle),
    );
  }
}
