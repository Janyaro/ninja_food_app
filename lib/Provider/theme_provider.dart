import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }


  bool _isvisibility = false;
   bool get isVisibility  => _isvisibility;
   // change the visibility item 
  void toogleVisibility (){
    _isvisibility = !_isvisibility;
    notifyListeners();
  }
}
