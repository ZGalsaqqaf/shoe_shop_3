import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shoe_shop_3/pages/category.dart';
import 'package:shoe_shop_3/pages/item.dart';
import 'package:shoe_shop_3/widgets/custom_carousel_slider.dart';
import 'package:shoe_shop_3/widgets_old/custom_drawer.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets_old/custom_card.dart';

class TestHomePage3 extends StatefulWidget {
  const TestHomePage3({super.key});

  @override
  State<TestHomePage3> createState() => _TestHomePage3State();
}

class _TestHomePage3State extends State<TestHomePage3> {
  IconData favoriteIcon = Icons.favorite_outline;

  // عدد العناصر التي ستظهر
  int _itemCount = 3;
  ScrollController _scrollController = ScrollController();

  Widget MyCard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.3,
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
            height: MediaQuery.of(context).size.width * 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("\$10"),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.07,
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
                    size: MediaQuery.of(context).size.height * 0.04,
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
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        print("==== Scroll at end");
        if (_itemCount < 4) {
          _itemCount += 3;
        }
        setState(() {});
      }
    });

    return Scaffold(
        appBar: SearchAppBar(context),
        drawer: CustomDrawer(context),
        body: ListView.builder(
          itemCount: _itemCount,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return index == 0
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.blue[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return CategoryPage();
                                }));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text("Women"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return CategoryPage();
                                }));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text("Men"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return CategoryPage();
                                }));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Text("Kids"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.01,
                        ),
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.01,
                        ),
                        child: CustomSlider(context),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return ItemPage();
                                }));
                              },
                              child: MyCard(),
                            ),
                            // كلاس خارجي فيه الكارد ايقونه المفضلة، الايقونه تتغير في الكونسول ولكن لا تظهر على الصفحة!!
                            // CustomCardClass(),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ItemPage();
                                }));
                              },
                              child: MyCard(),
                            ),
                            // كلاس خارجي فيه الكارد ايقونه المفضلة، الايقونه تتغير في الكونسول ولكن لا تظهر على الصفحة!!
                            // CustomCardClass(),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ItemPage();
                                }));
                              },
                              child: MyCard(),
                            ),
                            // كلاس خارجي فيه الكارد ايقونه المفضلة، الايقونه تتغير في الكونسول ولكن لا تظهر على الصفحة!!
                            // CustomCardClass(),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        )

        // ListView.builder(
        //   itemCount: _itemCount,

        //   controller: _scrollController,
        //   },

        //   itemBuilder: itemBuilder,
        // ),
        );
  }
}
