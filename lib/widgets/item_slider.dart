import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CarouselSlider ItemSlider(BuildContext context) {
  final List<String> slideList = [
    "women/heels/wh3.jpg",
    "women/heels/wh4.jpg",
    "women/heels/wh5.jpg",
  ];
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  return CarouselSlider(
    options: CarouselOptions(
      height: MediaQuery.of(context).size.height * 0.5,
      viewportFraction: 0.9,
      onPageChanged: (index, reason) {
        print("=== image index : $index === Reson of change: ${reason.name}");
      },
      // enlargeFactor : 0.2,
    ),
    items: slideList.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              // width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 0.5,
                ),
                // borderRadius: BorderRadius.all(Radius.circular(50)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.asset("assets/images/$i"),
              ));
        },
      );
    }).toList(),
  );
}
