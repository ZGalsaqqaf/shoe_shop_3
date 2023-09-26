import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration CustomInputDecoration({String label = "Label"}) {
  return InputDecoration(
    labelText: '$label',
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
  );
}
