import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_shop_3/widgets/custom_carousel_slider.dart';
import 'package:shoe_shop_3/widgets_old/custom_drawer.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets_old/custom_card.dart';

class TestHomePage1 extends StatefulWidget {
  const TestHomePage1({super.key});

  @override
  State<TestHomePage1> createState() => _TestHomePage1State();
}

class _TestHomePage1State extends State<TestHomePage1> {
  IconData favoriteIcon = Icons.favorite_outline;

  Widget MyCard(){
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
                            if (favoriteIcon == Icons.favorite_outline) {
                              favoriteIcon = Icons.favorite;
                            } else {
                              favoriteIcon = Icons.favorite_outline;
                            }
                            setState(() {});
                          },
                          child: Positioned(
                            top: 8,
                            right: 8,
                            child: Icon(
                              favoriteIcon,
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
            
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(context),
      drawer: CustomDrawer(context),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                // color: Colors.blue[50],
                child: CustomSlider(context),
              ),
              SizedBox(
                width: 300,
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              MyCard(),

              // كلاس خارجي فيه الكارد ايقونه المفضلة، الايقونه تتغير في الكونسول ولكن لا تظهر على الصفحة!!
              // CustomCardClass(),

              ],
          ),
        ),
      ),
    );
  }
}
