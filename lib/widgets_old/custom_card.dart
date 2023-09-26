import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../myclasses/favorite_icon.dart';

class CustomCardClass extends StatefulWidget {
  const CustomCardClass({super.key});

  @override
  State<CustomCardClass> createState() => _CustomCardClassState();
}

class _CustomCardClassState extends State<CustomCardClass> {

  FavoriteIcon favIcn = FavoriteIcon();


  @override
  Widget build(BuildContext context) {
    return Container(
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2), // Shadow color
          spreadRadius: 2, // Spread radius
          blurRadius: 5, // Blur radius
          offset: Offset(0, 3), // Offset in x and y directions
        ),
      ],
    ),
    child: Column(
      children: [
        Image.asset(
          "assets/images/women/sneakers/wsk1.jpg",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("\$10"),
            SizedBox(
              width: 45,
            ),

            // اضافة اايقونة المفضلة
            GestureDetector(
              onTap: () {
                favIcn.ChangeIcon();
                setState(){}
                print(favIcn.favoriteIcon);
              },
              child: Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  favIcn.favoriteIcon,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        Text(
          "details details details",
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
;
  }
}