import 'dart:async';
import 'package:ecomm/ui/login/login_scn.dart';
import 'package:ecomm/ui/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 2), () => print('=======object'));
    Future.delayed(
        Duration(seconds: 3),
        () => {
              Navigator.pop(context),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScr()),
              ),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // stops: [
                      //   0.1,
                      //   0.4,
                      //   0.7,
                      //   // 0.9
                      // ],
                      colors: [
                        Colors.purple,
                        // Colors.deepPurpleAccent,
                        // Colors.purpleAccent,
                        Colors.deepPurple,
                      ]),
                  color: Colors.lightBlue),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                            image: AssetImage('assets/images/app_icon.jpg'),
                            fit: BoxFit.cover,
                            ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          'Welcome  to  SwadesiShop',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text(
                          'Online Place      \n      For Everyone',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
