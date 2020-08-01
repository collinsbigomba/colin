import 'dart:async'; //because we a using a timer

import 'package:app1/curved.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color firstcolor = Color(0xFFF47015);
Color secondcolor = Color(0xFFEF7727C); //gradient of colors

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        'home': (context) => CurvedPage(), // moves to the curved page
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void startTimer() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('home');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                //color: Color(0xff622F74),
                gradient: LinearGradient(colors: [
              firstcolor,
              secondcolor
              //Colors.red,Colors.purple,Colors.yellow,Colors.blue
            ])),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 75,
                    child: Icon(
                      FontAwesomeIcons.university,
                      color: Colors.deepOrange,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text('Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )),
                  //SizedBox(height:300),
                  Padding(padding: EdgeInsets.only(top: 300)),
                  CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
