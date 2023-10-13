import 'package:flutter/material.dart';

List<String> colors = [
    'Black',
    'White',
    'Brown',
    'Red',
    'Blue',
    'Green',
    'Yellow',
  ];

Color getColorFromName(String colorName) {
    switch (colorName) {
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Green':
        return Colors.green;
      case 'Yellow':
        return Colors.yellow;
      case 'Black':
        return Colors.black;
      case 'White':
        return Colors.white;
        case 'Brown':
        return Colors.brown;
      default:
        return Colors.black;
    }
  }