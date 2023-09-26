import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{

  // instance of theme mode
  ThemeMode _themeMode = ThemeMode.dark;

  get themeMode => _themeMode;

  // isDark come from the switch widget
  toggleTheme(bool isDark){
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    // notifyListeners();
  }

}