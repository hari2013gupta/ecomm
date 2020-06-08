import 'dart:math';

import 'package:ecomm/ui/home/search_event.dart';
import 'package:ecomm/ui/page2.dart';
import 'package:ecomm/widgets/drawer.dart';
import 'package:ecomm/widgets/image_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = false;
  double _width = 300, _height = 300;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  Color _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.1,
        // backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: PlaceSearchDelegate());
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: MyDrawer(),
      // bottomNavigationBar: ,
      body: Column(
        children: <Widget>[
          MyImageCarousel(),
          //to do here
        ],
      ),
      // Center(
      // child: AnimatedOpacity(
      //   opacity: _visible ? 1.0 : 0.0,
      //   duration: Duration(milliseconds: 500),
      //   child: Container(
      //     width: 200.0,
      //     height: 200.0,
      //     color: Colors.green,
      //   ),
      // ),
      // child: AnimatedContainer(
      //   width: _width,
      //   height: _height,
      //   decoration: BoxDecoration(
      //     color: _color,
      //     borderRadius: _borderRadius,
      //   ),
      //   duration: Duration(milliseconds: 500),
      //   curve: Curves.fastOutSlowIn, //animation
      // ),
      // child: image_carousel,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // _visible = !_visible;

            final random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());

            Navigator.of(context).push(_createRoute());
          });
        },
        tooltip: 'Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(
      title: 'Page 2',
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
