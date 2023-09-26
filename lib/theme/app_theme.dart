import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.grey[50]!,
      background: Colors.grey[500]!,
      // Add other color scheme properties as needed
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.blue,
      ),
      headline1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontSize: 13,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.grey[200],
        fontSize: 16.0,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );
  /*
  TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
  */

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey[900]!,
      secondary: Colors.grey[700]!,
      background: Colors.black,
      // Add other color scheme properties as needed
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        color: Colors.grey[300],
      ),
      headline1: TextStyle(
        color: Colors.grey[300],
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: Colors.grey[300],
        fontSize: 13,
      ),
      headline3: TextStyle(
        color: Colors.grey[300],
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.grey[200],
        fontSize: 16.0,
        // fontWeight: FontWeight.bold,
      ),
    ),
  );
}
