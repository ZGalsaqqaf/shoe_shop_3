import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration TestCustomInputDecoration({
      String hint="Hint Text", 
      String label="Label", 
      Color hintColor=const Color.fromARGB(255, 91, 168, 232),
      Color labelColor=Colors.blue,
      double hintFontSize=15,
      double labelFontSize=18,
      FontWeight hintFontWeight=FontWeight.normal,
      FontWeight LabelFontWeight=FontWeight.bold,
      double borderRadiusCircular=15,
      }) {
  
    
    
  return InputDecoration(
    
    hintText: hint,
    hintStyle: TextStyle(
      color: hintColor,
      fontSize: hintFontSize,
      fontWeight:hintFontWeight,
    ),
    
    border: OutlineInputBorder(
      borderSide: BorderSide(
          // color: Colors.teal,
          ),
      borderRadius: BorderRadius.circular(borderRadiusCircular),
    ),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(borderRadiusCircular)),
  );
}
