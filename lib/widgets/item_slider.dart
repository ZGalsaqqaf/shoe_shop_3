import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselSlider ItemSlider(BuildContext context, List<String>images) {

  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  return CarouselSlider(
    options: CarouselOptions(
      height: MediaQuery.of(context).size.height * 0.3,
      viewportFraction: 0.9,
      onPageChanged: (index, reason) {
        print("=== image index : $index === Reson of change: ${reason.name}");
      },
    ),
    items: images.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Image.network("$i"),
              ));
        },
      );
    }).toList(),
  );
}
