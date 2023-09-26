import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
  ),
   textTheme: TextTheme(
    // Set the text color for different text styles
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    // Add more text styles as needed
  ),
);