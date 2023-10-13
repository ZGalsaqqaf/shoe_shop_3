import 'package:flutter/material.dart';
import 'package:shoe_shop_3/models/category_model.dart';
import 'package:shoe_shop_3/reops/category_repo.dart';
import 'package:shoe_shop_3/widgets/custom_card_no_details.dart';
import 'package:shoe_shop_3/widgets/custom_card_with_discount.dart';
import 'package:shoe_shop_3/widgets/custom_home_slider.dart';
import 'package:shoe_shop_3/widgets/search_appbar.dart';

import '../models/product_model.dart';
import '../reops/product_repo.dart';
import '../widgets/custom_drawer_app_mode.dart';
import 'fake_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData favoriteIcon = Icons.favorite_outline;
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
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: CustomHomeSlider(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              child: FutureBuilder<List<CategoryModel>>(
                future: CategoryRepository().getAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text("Error: ${snapshot.error.toString()}"));
                    }

                    var items = snapshot.data ?? [];
                    return Container(
                      height: 105.0, // Add a fixed height to the container
                      child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() {});
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var category = items[index];
                            return GestureDetector(
                                onTap: () {},
                                child: CustomCardNoDetails(context,
                                    category.name ?? '', category.image ?? ''));
                          },
                          itemCount: items.length,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              child: Divider(),
            ),
            Container(
              child: FutureBuilder<List<ProductShoeModel>>(
                future: ProductShoeRepository().getAll(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text("Error: ${snapshot.error.toString()}"));
                    }

                    var items = snapshot.data ?? [];
                    return Container(
                      height: 200.0, // Add a fixed height to the container
                      child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() {});
                        },
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var product = items[index];
                            var cate = product.cateId![0];
                            return GestureDetector(
                                onTap: () {
                                  print(items.length);
                                },
                                child: CustomCardWithDiscount(context, true, cate.name??'', product.details??'', product.price??0.0, product.image??''));
                          },
                          itemCount: items.length,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
