import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../widgets/custom_card2.dart';
import '../widgets/custom_drawer_app_mode.dart';
import 'fake_pages.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  IconData favoriteIcon = Icons.favorite_outline;

  // عدد العناصر التي ستظهر
  int _itemCount = 9;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        print("==== Scroll at end");
        if (_itemCount < 15) {
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
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: GridView.builder(
          controller: _scrollController,
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ItemPage();
                }));
              },
              child: CustomCard2(context),
            );
          },
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
