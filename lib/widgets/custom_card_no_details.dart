import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomCardNoDetails(BuildContext context) {
  String itemImage = "assets/images/women/sneakers/wsk5.webp";
  String itemName = "Sneakers";
  String itemDetails = "xxxx xxxxxxxx xxxx";
  double itemPrice = 10;

  return Container(
    margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
    width: MediaQuery.of(context).size.width * 0.35,
    height: MediaQuery.of(context).size.height * 0.15,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 2,
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              // جعل حواف الصورة محنية
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(15.0), // Set the border radius
                child: Image.asset(
                  itemImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 88, 162, 223).withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    "$itemName",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
