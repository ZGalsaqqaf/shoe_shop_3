import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CarouselSlider CustomSlider(BuildContext context) {
  return CarouselSlider(
    options: CarouselOptions(
      // height: MediaQuery.of(context).size.height * 0.3,
      aspectRatio: 1.8, // image hight
      viewportFraction: 0.9,  // slider width
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 2),
      onPageChanged: (index, reason) {
        print("=== image index : $index === Reson of change: ${reason.name}");
      },
      // السلايد الحالي اكبر من الذي جنبه
      enlargeCenterPage: true,
      // enlargeFactor : 0.2,
    ),
    items: ["women/sneakers/wsk1.jpg", "men/dress/md1.jpg", "women/heels/ws1.jpg", "girls/sandals/gsa2.jpg"].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              // width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color.fromARGB(37, 0, 0, 0),
                  width: 0.3,
                ),
                // borderRadius: BorderRadius.all(Radius.circular(50)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Image.asset("assets/images/$i"),
              ));
        },
      );
    }).toList(),
  );
}
