import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../pages/fake_pages.dart';
import '../widgets/custom_card2.dart';
import '../widgets/custom_drawer_app_mode.dart';

class OldCategoryPage extends StatefulWidget {
  const OldCategoryPage({super.key});

  @override
  State<OldCategoryPage> createState() => _OldCategoryPageState();
}

class _OldCategoryPageState extends State<OldCategoryPage> {
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
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Theme.of(context).colorScheme.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return OldCategoryPage();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  child: Text(
                    "Women",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return OldCategoryPage();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  child: Text(
                    "Men",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return OldCategoryPage();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
                  ),
                  child: Text(
                    "Kids",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
        ],
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
