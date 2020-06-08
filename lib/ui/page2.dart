import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  static const String routeName = '/page2';
  final String title;
  Page2({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // drawer: MyDrawer(),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
