import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
  scaffoldBackgroundColor: Color(0xfff1f1f1)
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

class ThemeNotifier extends ChangeNotifier{
  final String key = 'theme'; //to save in the shared prefs
  SharedPreferences _prefs;
  bool _darktheme;

  bool get darkTheme =>_darktheme;  //getter for the dark theme

  ThemeNotifier(){  // constructor
    _darktheme = true;
    _loadFromPrefs();
  }

  toggleTheme(){ //function
  _darktheme =!_darktheme; //if true makes it false and if false it makes it true
  notifyListeners();
  _saveToPrefs();
}

_initPrefs() async {
  if (_prefs=null)
  _prefs = await SharedPreferences.getInstance();// to save the theme opened by user
}

_loadFromPrefs() async{
  await _initPrefs();
  _darktheme = _prefs.getBool(key) ?? true;
  notifyListeners();
}

_saveToPrefs() async{
  await _initPrefs();
  _prefs.setBool(key, _darktheme);
}

}
