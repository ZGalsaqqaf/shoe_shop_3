import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomCard2(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(5),
    width: MediaQuery.of(context).size.width * 0.3,
    height: MediaQuery.of(context).size.height * 0.29,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.background,
          spreadRadius: 3,
          blurRadius: 10,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(
            "assets/images/women/sneakers/wsk5.webp",
            fit: BoxFit.fitWidth,
            // fit: BoxFit.fill,
            // width: 200,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.009,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          child: Column(
            children: [
              Text(
                "Sneakers",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              Text(
                "xxxx xxxxxxxx xxx",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$10",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                      size: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
