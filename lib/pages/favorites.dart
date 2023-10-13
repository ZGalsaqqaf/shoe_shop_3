import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets/custom_card2.dart';
import '../widgets/custom_drawer_app_mode.dart';
import 'fake_pages.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  IconData favoriteIcon = Icons.favorite_outline;

  // عدد العناصر التي ستظهر
  int _itemCount = 2;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // _scrollController.addListener(() {
    //   if (_scrollController.position.atEdge &&
    //       _scrollController.position.pixels != 0) {
    //     print("==== Scroll at end");
    //     if (_itemCount < 8) {
    //       _itemCount += 3;
    //     }
    //     setState(() {});
    //   }
    // });
    IconData appModeIcon = Icons.sunny;

    void updateAppModeIcon(IconData newIcon) {
      setState(() {
        appModeIcon = newIcon;
      });
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: SearchAppBar(context),
        drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
        body: ListView.builder(
          itemCount: _itemCount,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.0,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    // padding: EdgeInsets.all(
                    //   MediaQuery.of(context).size.width * 0.01,
                    // ),
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
                              child: CustomCard2(context),
                            ),
                            // كلاس خارجي فيه الكارد ايقونه المفضلة، الايقونه تتغير في الكونسول ولكن لا تظهر على الصفحة!!
                            // CustomCardClass(),
                          ],
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
                              child: CustomCard2(context),
                            ),
                            // كلاس خارجي فيه الكارد ايقونه المفضلة، الايقونه تتغير في الكونسول ولكن لا تظهر على الصفحة!!
                            // CustomCardClass(),
                          ],
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
                              child: CustomCard2(context),
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
