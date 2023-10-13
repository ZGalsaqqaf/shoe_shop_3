import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/custom_card_no_details.dart';
import 'package:shoe_shop_3/widgets/custom_card_with_discount.dart';
import 'package:shoe_shop_3/widgets/custom_carousel_slider.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets/custom_drawer_app_mode.dart';
import 'fake_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData favoriteIcon = Icons.favorite_outline;

  // عدد العناصر التي ستظهر
  int _itemCount = 15;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        print("==== Scroll at end");
        if (_itemCount <= 24) {
          _itemCount += 3;
        }
        setState(() {});
      }
    });

    IconData appModeIcon = Icons.sunny;

    void updateAppModeIcon(IconData newIcon) {
      setState(() {
        appModeIcon = newIcon;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SearchAppBar(context),
      // drawer: TestCustomDrawerWithAppMode(updateAppModeIcon: updateAppModeIcon,),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: CustomSlider(context),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.163, // Specify the height of the horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return CustomCardNoDetails(context);
                  },
                ),
              ),
            ),
            SizedBox(
              child: Divider(),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 0.6,
              ),
              itemCount: _itemCount,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ItemPage();
                      }),
                    );
                  },
                  child: CustomCardWithDiscount(context, true),
                );
              },
            ),
          ],
        ),
      ),

      // ListView.builder(
      //   itemCount: _itemCount,

      //   controller: _scrollController,
      //   },

      //   itemBuilder: itemBuilder,
      // ),
    );
  }
}
