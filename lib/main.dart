import 'package:ecomm/theme.dart';
import 'package:ecomm/ui/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'SwadesiShop';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: theme(),
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
