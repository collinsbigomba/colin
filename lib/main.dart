import 'package:app1/curved.dart';
import 'package:app1/signin_signup.dart';
//import 'package:app1/theme.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (_) => ThemeNotifier(),
    //       child: Consumer<ThemeNotifier>(
    //         builder: (context,notifier,child){
    return MaterialApp(
      title: 'Material App', debugShowCheckedModeBanner: false,
      //             theme: notifier.darkTheme ? dark : light,  //if darktheme is true use it otherwise use  light

      home: Boom(),
      routes: {
        'home': (context) => CurvedPage(), // moves to the curved page
      },
    );

    //  },

    // ),
    // );
  }
}
