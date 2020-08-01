import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:async';

import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

//Color firstcolor = Color(0xFFF47015);
//Color secondcolor = Color(0xFFEF7727C);//gradient of colors

class Settings extends StatefulWidget {
  static var tag;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<Null> refreshList() async {
    await Future.delayed(Duration(
        seconds: 3)); // inorder for the refresh indicator to take 3 seconds
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColorStart: Color(0xFFF47015), //appbar color
        backgroundColorEnd: Color(0xFFEF7727C),
        elevation: 0,

        title: Text('Hostels',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 19,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: LiquidPullToRefresh(
        height: 100,
        color: Colors.orange[200],
        onRefresh: refreshList, // function  created at the top
        child: Scrollbar(
                  child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(40),
                        shadowColor: Color(0x802196F3),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Bbossar',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Container(
                              width: 350,
                              height: 200,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/d.png',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topRight,
                                  )),
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Katonga',
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellowAccent),
                          
                          Container(
                            width: 350,
                            height: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image.asset(
                                  'assets/images/c.jpeg',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Muggaga',
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Container(
                            width: 350,
                            height: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image.asset(
                                  'assets/images/df.jpeg',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Haflet',
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Container(
                            width: 350,
                            height: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image.asset(
                                  'assets/images/e.jpeg',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Half London',
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Container(
                            width: 350,
                            height: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image.asset(
                                  'assets/images/e.jpeg',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Kavuma',
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Container(
                            width: 350,
                            height: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image.asset(
                                  'assets/images/h.jpeg',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(40),
                      shadowColor: Color(0x802196F3),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Onyango',
                            style: TextStyle(fontSize: 25),
                          ),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Container(
                            width: 350,
                            height: 200,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                child: Image.asset(
                                  'assets/images/3.png',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
